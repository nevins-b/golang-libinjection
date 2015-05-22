package libinjection

import (
	"net/url"
	"testing"

	"github.com/stretchr/testify/assert"
)

func Test_XSS_1(t *testing.T) {
	in, _ := url.QueryUnescape("<scr%00ipt>confirm(0);</scr%00ipt>")
	found := IsXSS(in)
	assert.True(t, found)
}
