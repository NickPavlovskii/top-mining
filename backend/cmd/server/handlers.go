package main

import (
	"encoding/json"
	"errors"
	"net/http"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"

	"niklad/backend/internal/articles"
	"niklad/backend/internal/catalog"
)

type errorResponse struct {
	Error string `json:"error" example:"internal server error"`
}

// HealthCheck godoc
// @Summary      Проверка сервера
// @Description  Возвращает ok, если HTTP-сервер запущен
// @Tags         system
// @Produce      plain
// @Success      200 {string} string "ok"
// @Router       /health [get]
func HealthCheck(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(http.StatusOK)
	_, _ = w.Write([]byte("ok"))
}

// GetCatalog godoc
// @Summary      Каталог организаций
// @Description  Возвращает категории и организации из PostgreSQL
// @Tags         catalog
// @Produce      json
// @Success      200 {object} catalog.Data
// @Failure      500 {object} errorResponse
// @Router       /api/catalog [get]
func GetCatalog(pool *pgxpool.Pool) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		data, err := catalog.FetchCatalog(r.Context(), pool)
		if err != nil {
			writeJSON(w, http.StatusInternalServerError, errorResponse{Error: err.Error()})
			return
		}

		writeJSON(w, http.StatusOK, data)
	}
}

// GetArticles godoc
// @Summary      Лента статей
// @Description  Возвращает hero, featured и list для главной
// @Tags         articles
// @Produce      json
// @Param        topic query string false "Тема: all, news, mining..."
// @Success      200 {object} articles.Feed
// @Failure      500 {object} errorResponse
// @Router       /api/articles [get]
func GetArticles(pool *pgxpool.Pool) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		feed, err := articles.FetchFeed(r.Context(), pool, r.URL.Query().Get("topic"))
		if err != nil {
			writeJSON(w, http.StatusInternalServerError, errorResponse{Error: err.Error()})
			return
		}

		writeJSON(w, http.StatusOK, feed)
	}
}

// GetArticle godoc
// @Summary      Статья по slug
// @Description  Полная статья для отдельной страницы
// @Tags         articles
// @Produce      json
// @Param        slug path string true "Slug статьи"
// @Success      200 {object} articles.Article
// @Failure      404 {object} errorResponse
// @Failure      500 {object} errorResponse
// @Router       /api/articles/{slug} [get]
func GetArticle(pool *pgxpool.Pool) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		article, err := articles.FetchBySlug(r.Context(), pool, r.PathValue("slug"))
		if err != nil {
			if errors.Is(err, pgx.ErrNoRows) {
				writeJSON(w, http.StatusNotFound, errorResponse{Error: "article not found"})
				return
			}

			writeJSON(w, http.StatusInternalServerError, errorResponse{Error: err.Error()})
			return
		}

		writeJSON(w, http.StatusOK, article)
	}
}

func writeJSON(w http.ResponseWriter, status int, payload any) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)
	_ = json.NewEncoder(w).Encode(payload)
}
