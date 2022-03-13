plugin {
	url    = 'L3MON4D3/LuaSnip',
	as     = 'snippets',
	event  = "BufEnter",
	config = function ()
		require("luasnip.loaders.from_vscode").lazy_load({ path = "./friendly-snippets/snippets" })
	end
}
