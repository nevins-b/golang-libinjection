package libinjection

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func Test_SQLi_36(t *testing.T) {
	found, fingerprint := IsSQLi("foo\" and 1=1 `")
	assert.True(t, found)
	assert.Equal(t, "s&1c", fingerprint, "Fingerprint mismatch")
}
