// Package docs Swagger документация API.
//
// Перегенерация (после изменения аннотаций в handlers.go):
//
//	go install github.com/swaggo/swag/cmd/swag@latest
//	swag init -g cmd/server/main.go -o docs --parseDependency --parseInternal
package docs

import "github.com/swaggo/swag"

const docTemplate = `{
    "schemes": {{ marshal .Schemes }},
    "swagger": "2.0",
    "info": {
        "description": "{{escape .Description}}",
        "title": "{{.Title}}",
        "contact": {},
        "version": "{{.Version}}"
    },
    "host": "{{.Host}}",
    "basePath": "{{.BasePath}}",
    "paths": {
        "/api/catalog": {
            "get": {
                "description": "Возвращает категории и организации из PostgreSQL",
                "produces": ["application/json"],
                "tags": ["catalog"],
                "summary": "Каталог организаций",
                "responses": {
                    "200": {
                        "description": "OK",
                        "schema": {
                            "$ref": "#/definitions/catalog.Data"
                        }
                    },
                    "500": {
                        "description": "Internal Server Error",
                        "schema": {
                            "$ref": "#/definitions/main.errorResponse"
                        }
                    }
                }
            }
        },
        "/health": {
            "get": {
                "description": "Возвращает ok, если HTTP-сервер запущен",
                "produces": ["text/plain"],
                "tags": ["system"],
                "summary": "Проверка сервера",
                "responses": {
                    "200": {
                        "description": "ok",
                        "schema": {
                            "type": "string"
                        }
                    }
                }
            }
        }
    },
    "definitions": {
        "catalog.Category": {
            "type": "object",
            "properties": {
                "id": { "type": "integer" },
                "name": { "type": "string" },
                "organizations": {
                    "type": "array",
                    "items": { "$ref": "#/definitions/catalog.Organization" }
                },
                "slug": { "type": "string" }
            }
        },
        "catalog.Data": {
            "type": "object",
            "properties": {
                "categories": {
                    "type": "array",
                    "items": { "$ref": "#/definitions/catalog.Category" }
                },
                "meta": { "$ref": "#/definitions/catalog.Meta" }
            }
        },
        "catalog.Meta": {
            "type": "object",
            "properties": {
                "subtitle": { "type": "string" },
                "totalReviews": { "type": "integer" }
            }
        },
        "catalog.Organization": {
            "type": "object",
            "properties": {
                "id": { "type": "integer" },
                "logoUrl": { "type": "string" },
                "name": { "type": "string" },
                "rating": { "type": "number" },
                "reviewCount": { "type": "integer" }
            }
        },
        "main.errorResponse": {
            "type": "object",
            "properties": {
                "error": {
                    "type": "string",
                    "example": "internal server error"
                }
            }
        }
    }
}`

// SwaggerInfo holds exported Swagger Info so clients can modify it.
var SwaggerInfo = &swag.Spec{
	Version:          "1.0",
	Host:             "localhost:8080",
	BasePath:         "/",
	Schemes:          []string{},
	Title:            "Niklad Catalog API",
	Description:      "REST и GraphQL API каталога организаций",
	InfoInstanceName: "swagger",
	SwaggerTemplate:  docTemplate,
	LeftDelim:        "{{",
	RightDelim:       "}}",
}

func init() {
	swag.Register(SwaggerInfo.InstanceName(), SwaggerInfo)
}
