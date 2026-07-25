package envfile

import (
	"bufio"
	"os"
	"strings"
)

// Load читает первый доступный .env-файл и выставляет переменные,
// только если они ещё не заданы в окружении.
func Load(paths ...string) {
	for _, path := range paths {
		file, err := os.Open(path)
		if err != nil {
			continue
		}

		scanner := bufio.NewScanner(file)
		for scanner.Scan() {
			line := strings.TrimSpace(scanner.Text())
			if line == "" || strings.HasPrefix(line, "#") {
				continue
			}

			key, value, ok := strings.Cut(line, "=")
			if !ok {
				continue
			}

			key = strings.TrimSpace(key)
			value = strings.TrimSpace(value)
			value = strings.Trim(value, `"'`)

			if key != "" && os.Getenv(key) == "" {
				_ = os.Setenv(key, value)
			}
		}

		_ = file.Close()
		return
	}
}
