package catalog

import "encoding/json"

func unmarshalOrganizations(raw []byte) ([]Organization, error) {
	var organizations []Organization
	if err := json.Unmarshal(raw, &organizations); err != nil {
		return nil, err
	}
	return organizations, nil
}
