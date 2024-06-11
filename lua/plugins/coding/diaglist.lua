-- diagnostics for [utils.java.synchronize_diagnostics_java]
return {
	"onsails/diaglist.nvim",
	config = function()
		require("diaglist").init({
			debug = false,
			debounce_ms = 150,
		})
	end,
}
