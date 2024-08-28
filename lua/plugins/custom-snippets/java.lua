local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- tdd
ls.add_snippets("java", {
	s("tdd", {
		t("@Test"),
		t({ "", "public void " }), i(1), t("() throws Exception {"),
		t({ "", "\t// given", "", "\t// when", "", "\t// then", "", "}" }),
	}),
})
