-- Test injections
local function test_injection()
	local bufnr = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(bufnr, "filetype", "markdown")
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {
		"```{code-cell} ipython3",
		"print('hello world')",
		"print('something')",
		"```",
	})
	local parser = require("nvim-treesitter.parsers").get_parser(bufnr)
	parser:parse({ range = true })
	local flattened =
		require("nvim-treesitter-playground.printer").process(bufnr, parser, { suppress_injected_languages = false })

	local text = nil
	for i, node_entry in ipairs(flattened) do
		if node_entry.language_tree:lang() == "python" then
			text = vim.treesitter.get_node_text(node_entry.node:parent(), bufnr)
			break
		end
	end
	assert(text ~= nil)
end

describe("test language injection", function()
	before_each(function()
		require("nvim-treesitter.query_predicates")
		require("mystnb.treesitter").init({ ipython3 = "python" })
	end)
	it("Test python injection", test_injection)
end)
