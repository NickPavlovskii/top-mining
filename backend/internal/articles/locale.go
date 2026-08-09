package articles

import "strings"

func NormalizeLocale(locale string) string {
	switch strings.ToLower(strings.TrimSpace(locale)) {
	case "en":
		return "en"
	default:
		return "ru"
	}
}

func useTranslations(locale string) bool {
	return NormalizeLocale(locale) == "en"
}
