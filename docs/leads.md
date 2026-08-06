# Заявки, подписка и Zod

Документ описывает, как на Top Mining сохраняются заявки с форм, как работает статус отправки и зачем подключён **Zod**.

## Зачем это нужно

Формы на сайте (футер, консалтинг, дата-центры, buy ASIC, подбор и т.д.) отправляют **телефон / Telegram / email**. Нужно:

1. Проверить данные до записи.
2. Сохранить заявку в Postgres.
3. (Опционально) уведомить админов в Telegram.
4. Показать пользователю красивый статус успеха / ошибки.

## Поток заявки

```text
Форма (Vue)
  → useSubmitLead  +  Zod (клиент)
  → POST /api/leads
  → Zod ещё раз (сервер)
  → GraphQL createLead
  → таблица leads
  → Telegram (best-effort)
  → TopMiningFormStatus (UI)
```

Подписка на рассылку устроена похоже:

```text
useSubscribeEmail + Zod → POST /api/subscribe → SMTP welcome + Telegram
```

## Ключевые файлы

| Файл | Роль |
|------|------|
| [`backend/migrations/031_leads.sql`](../backend/migrations/031_leads.sql) | Таблица `leads` |
| [`backend/internal/leads/`](../backend/internal/leads/) | Insert в Postgres |
| [`backend/internal/graphql/schema.go`](../backend/internal/graphql/schema.go) | Mutation `createLead` |
| [`common/modules/top-mining/layout/leads.ts`](../common/modules/top-mining/layout/leads.ts) | Zod-схема заявки, UI-тексты |
| [`common/modules/top-mining/layout/subscribe.ts`](../common/modules/top-mining/layout/subscribe.ts) | Zod-схема подписки |
| [`composables/useSubmitLead.ts`](../composables/useSubmitLead.ts) | Клиентская отправка заявки |
| [`composables/useSubscribeEmail.ts`](../composables/useSubscribeEmail.ts) | Клиентская подписка |
| [`server/api/leads.post.ts`](../server/api/leads.post.ts) | BFF: валидация → GraphQL → Telegram |
| [`server/api/subscribe.post.ts`](../server/api/subscribe.post.ts) | BFF: валидация → SMTP / Telegram |
| [`components/global/forms/TopMiningFormStatus.vue`](../components/global/forms/TopMiningFormStatus.vue) | Глобальный UI статуса |
| [`server/utils/telegram/send.ts`](../server/utils/telegram/send.ts) | Отправка сообщений в Telegram |

## Таблица `leads`

Миграция `031_leads.sql`:

| Колонка | Смысл |
|---------|--------|
| `source` | Откуда форма (`footer-contact`, `buy-asic-hero`, …) |
| `name` | Имя |
| `contact` | Телефон / Telegram |
| `message` | Текст вопроса |
| `payload` | JSONB доп. полей (регион, мощность, …) |
| `page_path` | Страница, с которой отправили |
| `created_at` | Время |

Применить на существующую БД:

```powershell
cd backend
go run ./cmd/migrate
```

Перезапустить GraphQL после миграции.

## Переменные окружения

Секреты только в **локальном** `.env` (файл в `.gitignore`, в git не коммитить).

Шаблон: [`.env.example`](../.env.example).

| Переменная | Зачем |
|------------|--------|
| `SMTP_*` | Welcome-письмо при подписке |
| `TELEGRAM_BOT_TOKEN` | Токен бота (@BotFather) |
| `TELEGRAM_CHAT_ID` | Чат/канал для уведомлений |

Без Telegram заявки всё равно пишутся в БД; без SMTP подписка может уйти только в Telegram (если он настроен).

---

## Что делает Zod у нас

**Zod не сохраняет заявки и не шлёт письма.** Он только отвечает: «этот payload можно принимать» или «нет, вот ошибка».

Одна схема используется:

1. на **клиенте** (до `$fetch`) — сразу показать ошибку;
2. на **сервере** (в API) — не пустить мусор в БД.

### Схема заявки (упрощённо)

```ts
import { z } from 'zod'

const leadSubmitSchema = z.object({
  source: z.string().trim().min(1, 'source is required'),
  contact: z.string().trim().min(1, 'contact is required'),
  name: z.string().trim().optional().default(''),
  message: z.string().trim().optional().default(''),
  fields: z.record(z.string(), z.string()).optional().default({}),
  website: z.string().optional().default(''), // honeypot
  pagePath: z.string().trim().optional().default(''),
})
```

Хелпер в проекте:

```ts
parseLeadSubmit(input) // → { ok: true, data } | { ok: false, error }
```

### Примеры

**Успех:**

```ts
parseLeadSubmit({
  source: 'footer-contact',
  contact: '  @user  ',
  name: ' Иван ',
})
// → { ok: true, data: { source: 'footer-contact', contact: '@user', name: 'Иван', ... } }
```

**Ошибка:**

```ts
parseLeadSubmit({ source: 'home-phone', contact: '   ' })
// → { ok: false, error: 'contact is required' }
```

**Подписка (нормализация email):**

```ts
parseSubscribeSubmit({ email: '  User@Mail.RU ', source: 'footer' })
// → { ok: true, data: { email: 'user@mail.ru', source: 'footer', ... } }

parseSubscribeSubmit({ email: 'не почта' })
// → { ok: false, error: 'Укажите корректный e-mail' }
```

### Как объяснить за 30 секунд

1. **Схема** — правила для объекта.
2. **`safeParse`** — «ок / не ок» + чистые данные или текст ошибки.
3. Описали **один раз** — используем в UI и в API.
4. Zod **не** пишет в Postgres и **не** шлёт Telegram.

### Типы из схемы

```ts
type SubmitLeadInput = z.input<typeof leadSubmitSchema>   // что можно передать
type ParsedLeadSubmit = z.output<typeof leadSubmitSchema> // что после parse
```

---

## UI статуса

Глобальный компонент `top-mining-form-status`:

```vue
<top-mining-form-status
  :status="status"
  :message="feedback"
  tone="dark"
/>
```

Состояния: `loading` / `success` / `error`. На тёмных секциях — `tone="dark"`.

---

## Как добавить новую форму

1. Собрать поля в объект (`contact` обязателен).
2. Вызвать `useSubmitLead('my-source')` → `submit({ source, contact, name?, fields? })`.
3. Показать `<top-mining-form-status :status="status" :message="message" />`.
4. Honeypot при наличии — поле `website` (должно оставаться пустым).

Новую Zod-схему для каждой Vue-формы писать не нужно: проверяется общий контракт API.

---

## Тесты

```bash
npx vitest run test/unit/common/top-mining/layout/leads.spec.ts
npx vitest run test/unit/common/top-mining/layout/subscribe.spec.ts
npx vitest run test/unit/components/global/TopMiningFormStatus.spec.ts
```
