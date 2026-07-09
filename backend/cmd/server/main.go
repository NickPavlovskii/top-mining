package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/graphql-go/handler"
	httpSwagger "github.com/swaggo/http-swagger"

	_ "niklad/backend/docs"
	appgraphql "niklad/backend/internal/graphql"
	"niklad/backend/internal/catalog"
	"niklad/backend/internal/envfile"
)

func main() {
	envfile.Load(".env", "../.env")

	ctx := context.Background()

	pool, err := catalog.Connect(ctx)
	if err != nil {
		log.Fatalf("database: %v", err)
	}
	defer pool.Close()

	schema, err := appgraphql.BuildSchema(pool)
	if err != nil {
		log.Fatalf("graphql schema: %v", err)
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	h := handler.New(&handler.Config{
		Schema:   &schema,
		Pretty:   true,
		GraphiQL: true,
	})

	mux := http.NewServeMux()
	mux.Handle("/graphql", corsMiddleware(h))
	mux.HandleFunc("/health", HealthCheck)
	mux.Handle("/swagger/", corsMiddleware(httpSwagger.WrapHandler))

	server := &http.Server{
		Addr:              ":" + port,
		Handler:           mux,
		ReadHeaderTimeout: 10 * time.Second,
	}

	go func() {
		log.Printf("GraphQL:  http://localhost:%s/graphql", port)
		log.Printf("Swagger: http://localhost:%s/swagger/index.html", port)
		if err := server.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("server: %v", err)
		}
	}()

	stop := make(chan os.Signal, 1)
	signal.Notify(stop, syscall.SIGINT, syscall.SIGTERM)
	<-stop

	shutdownCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	_ = server.Shutdown(shutdownCtx)
}

func corsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type")

		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusNoContent)
			return
		}

		next.ServeHTTP(w, r)
	})
}
