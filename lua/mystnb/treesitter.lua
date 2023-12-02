local utils = require("mystnb.utils")

local M = {}

function M.init(lookup)
	vim.treesitter.query.add_directive(
		"set-lang-from-info-string-line!",
		function(match, pattern, bufnr, predicate, metadata)
			local node = match[predicate[2]]
			if node ~= nil then
				local info_string = vim.treesitter.get_node_text(node, bufnr)
				local language = utils.find_language_in_info_string(info_string, "python", lookup)
				metadata["injection.language"] = language
			end
		end,
		true
	)
end

return M
