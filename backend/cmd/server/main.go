package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/graphql-go/graphql"
	"github.com/graphql-go/handler"
	"github.com/jackc/pgx/v5/pgxpool"
	httpSwagger "github.com/swaggo/http-swagger"

	_ "niklad/backend/docs"
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

	schema, err := buildSchema(pool)
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
	mux.Handle("/api/catalog", corsMiddleware(GetCatalog(pool)))
	mux.HandleFunc("GET /api/articles", GetArticles(pool))
	mux.HandleFunc("GET /api/articles/{slug}", GetArticle(pool))
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

func buildSchema(pool *pgxpool.Pool) (graphql.Schema, error) {
	organizationType := graphql.NewObject(graphql.ObjectConfig{
		Name: "Organization",
		Fields: graphql.Fields{
			"id":          &graphql.Field{Type: graphql.Int},
			"name":        &graphql.Field{Type: graphql.String},
			"logoUrl":     &graphql.Field{Type: graphql.String},
			"description": &graphql.Field{Type: graphql.String},
			"rating":      &graphql.Field{Type: graphql.Float},
			"reviewCount": &graphql.Field{Type: graphql.Int},
		},
	})

	categoryType := graphql.NewObject(graphql.ObjectConfig{
		Name: "Category",
		Fields: graphql.Fields{
			"id":            &graphql.Field{Type: graphql.Int},
			"name":          &graphql.Field{Type: graphql.String},
			"slug":          &graphql.Field{Type: graphql.String},
			"organizations": &graphql.Field{Type: graphql.NewList(organizationType)},
		},
	})

	metaType := graphql.NewObject(graphql.ObjectConfig{
		Name: "CatalogMeta",
		Fields: graphql.Fields{
			"totalReviews": &graphql.Field{Type: graphql.Int},
			"subtitle":     &graphql.Field{Type: graphql.String},
		},
	})

	catalogType := graphql.NewObject(graphql.ObjectConfig{
		Name: "Catalog",
		Fields: graphql.Fields{
			"meta":       &graphql.Field{Type: metaType},
			"categories": &graphql.Field{Type: graphql.NewList(categoryType)},
		},
	})

	rootQuery := graphql.NewObject(graphql.ObjectConfig{
		Name: "Query",
		Fields: graphql.Fields{
			"catalog": &graphql.Field{
				Type: catalogType,
				Resolve: func(params graphql.ResolveParams) (interface{}, error) {
					data, err := catalog.FetchCatalog(params.Context, pool)
					if err != nil {
						return nil, err
					}

					return map[string]interface{}{
						"meta": map[string]interface{}{
							"totalReviews": data.Meta.TotalReviews,
							"subtitle":     data.Meta.Subtitle,
						},
						"categories": toGraphQLCategories(data.Categories),
					}, nil
				},
			},
		},
	})

	return graphql.NewSchema(graphql.SchemaConfig{Query: rootQuery})
}

func toGraphQLCategories(categories []catalog.Category) []map[string]interface{} {
	result := make([]map[string]interface{}, 0, len(categories))

	for _, category := range categories {
		organizations := make([]map[string]interface{}, 0, len(category.Organizations))
		for _, org := range category.Organizations {
			organizations = append(organizations, map[string]interface{}{
				"id":          org.ID,
				"name":        org.Name,
				"logoUrl":     org.LogoURL,
				"description": org.Description,
				"rating":      org.Rating,
				"reviewCount": org.ReviewCount,
			})
		}

		result = append(result, map[string]interface{}{
			"id":            category.ID,
			"name":          category.Name,
			"slug":          category.Slug,
			"organizations": organizations,
		})
	}

	return result
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
