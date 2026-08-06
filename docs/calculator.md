# Майнинг-калькулятор — полная спецификация

Документ описывает UI, параметры, формулы и поток `calculate()` для
`CalculatorForm` / `calculator-profit.ts` (страница `/calculator` и блок на главной).

---

## 01. Общая схема экрана

```
┌─────────────────────────────────────────────────────────┐
│ (01) Тип устройства:  ASIC | GPU | CPU                  │
│ (02) Модель: дерево бренд → модель (+ поиск)            │
├─────────────────────────────────────────────────────────┤
│ Блок параметров (lock, пока нет модели;                 │
│   для ASIC — «Ввести параметры» вручную)                │
│  Базовые → Расширенные опции → Кнопки                   │
├─────────────────────────────────────────────────────────┤
│ Результат: вкладки ₽ | USDT | монета                    │
└─────────────────────────────────────────────────────────┘
```

Код: `components/calculator/form/CalculatorForm.vue`.

---

## 02. Переключатели и каталоги

### Тип устройства

| Вкладка | Каталог | Хешрейт по умолчанию | Ручной unlock без модели |
|---------|---------|----------------------|---------------------------|
| ASIC    | асики   | Th/s                 | да («Ввести параметры»)   |
| GPU     | видеокарты | Mh/s              | нет                       |
| CPU     | процессоры | Mh/s              | нет                       |

При смене вкладки: сброс модели, хешрейта, мощности, алгоритма; для ASIC снова BTC.

### Модель (tree-select)

`TopMiningSelect` mode=`tree`: бренд → модели, поиск.  
Данные: GraphQL `calculatorHardware` → `GET /api/calculator/hardware` (таблицы `hardware_*` в PostgreSQL).  
При выборе: hashrate, hashrateUnit, powerW; для GPU/CPU — algorithm.

Типы/хелперы без мок-массива: `common/modules/top-mining/calculator/hardware.ts`
(`CALCULATOR_DEVICE_OPTIONS`, `filterHardwareBrands`, `emptyCalculatorHardwareByKind`).

### Монета / алгоритм

- **ASIC:** flat-select по монетам из API/БД (ALEO…ZEC, включая **LTC+DOG**).
- **GPU/CPU:** сначала алгоритм (`gpuAlgorithms` из API), затем монеты GPU, отфильтрованные по алгоритму.

---

## 03. Входные параметры

### Базовые

| Параметр | ASIC | GPU/CPU | Ед. / выбор |
|----------|------|---------|-------------|
| Монета | ✓ | ✓ (после алгоритма) | select |
| Алгоритм | — | ✓ | select |
| Цена устройства | ✓ | ✓ | число + ₽/$ |
| Количество | асики | карты / CPU | ±, мин. 1 |
| Общая стоимость | read-only | read-only | цена × qty |
| Хешрейт | ✓ | ✓ | + Th/s…H/s |
| Потребление | ✓ | ✓ | Вт |
| Тариф эл-ва | ✓ | ✓ | + ₽/$ за кВт·ч |

### Расширенные опции

| Параметр | По умолчанию | Примечание |
|----------|--------------|------------|
| UP-TIME | 99 % | 0–100, в формуле /100 |
| Курс монета-USDT | из каталога | для LTC+DOG — LTC; плюс DOGE-USDT |
| Курс USDT-RUB | 79.2 | |
| Плата за пул | 4 % | в формуле /100 |
| Награда за блок | из монеты | |
| Сложность сети | из монеты | кнопки −5% / +5% |

`stepen` монеты (`2v32` / `2v13` / `0`→1) в UI не редактируется — берётся из данных монеты.

---

## 04. Как считает калькулятор

Логика WhatToMine / top-mining: доход пропорционален вашей доле в сети,
«тяжесть» задаётся сложностью и множителем `stepen`.

### Шаг 0 — хешрейт в TH/s

```
factor = { Th/s: 1, Gh/s: 1e-3, Mh/s: 1e-6, Kh/s: 1e-9, H/s: 1e-12 }
HR = хешрейт × factor[unit]
```

Код: `hashrateToThs()`.

### Шаг 1 — монеты за период

```
coins = reward × HR[TH/s] × 1e12 × 86400 × (1 − poolFee)
        × days × uptime / (difficulty × stepen) × quantity
```

где:

- `1e12` — перевод TH/s → H/s;
- `86400` — секунд в сутках;
- `stepen` = 2³² (BTC/SHA-256 и др.) / 2¹³ / 1 — из данных монеты (`parseStepen`);
- `poolFee` и `uptime` вводятся в **процентах**, в формуле делятся на 100.

Код: `totalCoins()` / `totalCoinsForLegs()`.

### Шаг 2 — деньги

```
income_USDT = coins × курс_монеты
income_RUB  = income_USDT × курс_USDT-RUB
```

Для **LTC+DOG**: две «ноги» (LTC и DOGE) считаются отдельно и **суммируются**.

### Шаг 3 — электричество / мес.

```
elec = (Вт / 1000) × 732 × uptime × тариф × quantity
```

`732` ч ≈ 24 × 30.5. Тариф в $ переводится в ₽ через USDT-RUB.  
Код: `placingMonthRub()`.

### Шаг 4–5 — итог

```
net      = income[30 дней] − elec
payback  = net > 0 ? (цена × quantity в USDT) / net_USDT : ∞
```

Разбивка периодов:

| Период | От дня |
|--------|--------|
| час    | день / 24 |
| месяц  | день × 30 |
| год    | день × 365 |

### Псевдокод ядра

```
function coinsPerDay(coin, HR_ths, poolFee, uptime, qty):
    stepen = parseStepen(coin.stepen)   # 2^32 | 2^13 | 1
    return coin.reward
         * HR_ths * 1e12                # TH/s → H/s
         * 86400 * (1 - poolFee) * uptime
         / (coin.difficulty * stepen)
         * qty
```

Код: `common/modules/top-mining/calculator/profit.ts` → `calculateMiningProfit()`.

---

## 05. Полный проход `calculate(input)`

```
function calculate():
    // --- валидация (алерты) ---
    if монета не выбрана (нет legs):
        alert «Выберите добываемую монету»
        return
    if !hashrate:
        alert «Введите хешрейт Вашего оборудования. Например: 300»
        return
    if !powerW:
        alert «Введите потребление Вашего оборудования. Например: 4950»
        return
    if !price || price <= 0:
        alert «Введите цену устройства.»
        return

    // --- ASIC: дефолтная цена ---
    if kind == asic AND price == 120_000:
        show DefaultPriceModal   # «Рассчитать» / закрыть (Отмена)
        // по подтверждению → runCalculate()
        return

    runCalculate()


function runCalculate():
    // повторная валидация (после модалки дефолтной цены)
    if not validate(...): return

    legs = buildProfitLegs()
        // обычная монета → один leg (reward, difficulty, rate, stepen)
        // LTC+DOG → [DOGE leg, LTC leg]

    device = { price, priceCurrency, quantity, hashrate, hashrateUnit,
               powerW, electricityPrice, electricityCurrency,
               uptimePercent, poolFeePercent, usdtRubRate }

    result = calculateMiningProfit(device, legs)

    show results table
    scroll to results


function reset():
    defaults (цена 120_000, qty 1, BTC, …)
    lock params
    clear profitResult
```

### Таблица результатов

Вкладки отображения: **₽ | USDT | символ монеты**.

| Строка | Источник |
|--------|----------|
| Доход / час | `incomeHour*` / `coinsHour` |
| Доход / день | `incomeDay*` / `coinsDay` |
| Доход / месяц | `incomeMonth*` / `coinsMonth` |
| Доход / год | `incomeYear*` / `coinsYear` |
| Стоимость размещения / мес. | `placingMonth*` |
| Срок окупаемости | `paybackMonths` или ∞ |
| Чистая прибыль / мес. | `cleanProfitMonth*` |

---

## 06. Ошибки / валидация (до расчёта)

| Условие | UI |
|---------|-----|
| монета не выбрана | алерт «Выберите добываемую монету» |
| нет хешрейта | «Введите хешрейт… Например: 300» |
| нет потребления (Вт) | «Введите потребление… Например: 4950» |
| нет / нулевая цена | «Введите цену устройства.» |
| ASIC + цена 120 000 (дефолт) | модалка-подтверждение «Рассчитать» / закрыть |
| всё ок | расчёт → скролл к результату |
| «Сбросить данные» | дефолты + lock + очистка результата |

Модалки: `CalculatorAlertModal`, `CalculatorDefaultPriceModal`.

---

## 07. Карта файлов

| Часть | Путь |
|-------|------|
| Форма | `components/calculator/form/CalculatorForm.vue` |
| Select | `components/global/forms/TopMiningSelect.vue` (+ types) |
| Wrappers | `CalculatorModelDropdown`, `CalculatorCoinDropdown`, `CalculatorAlgorithmDropdown` |
| Железо (типы/хелперы) | `common/modules/top-mining/calculator/hardware.ts` |
| Железо (БД) | GraphQL `calculatorHardware` → `GET /api/calculator/hardware` |
| Монеты / алгоритмы (БД) | GraphQL `calculatorCoins` → `GET /api/calculator/coins` |
| Монеты (типы/хелперы) | `calculator/coins.ts`, `calculator/gpu.ts` |
| Формулы | `calculator/profit.ts` |
| Страница | `pages/calculator/index.vue` |
| Главная | `MiningCalculatorPromo.vue` → `CalculatorForm` |

---

## 08. Пользовательский сценарий

1. Выбрать **ASIC / GPU / CPU**  
2. Выбрать **модель** (или на ASIC — ручной ввод)  
3. При необходимости сменить **монету** / **алгоритм**  
4. Поправить **цену, кол-во, хешрейт, Вт, тариф**  
5. Открыть **расширенные** при необходимости  
6. **Рассчитать** → доход / эл-во / окупаемость / чистая прибыль  
7. Переключить валюту результата **₽ / USDT / монета**  
8. **Сбросить** — начать заново  
