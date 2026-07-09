package main

import (
	"net/http"
)

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
