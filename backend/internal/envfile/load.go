package envfile

import (
	"bufio"
	"os"
	"strings"
)

// Load читает KEY=VALUE из первого существующего файла и задаёт переменные окружения.
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

			if key != "" {
				_ = os.Setenv(key, value)
			}
		}

		_ = file.Close()
		return
	}
}
