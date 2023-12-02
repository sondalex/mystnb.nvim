local M = {}
function M.setup(config)
	if not config then
		config = {}
	end
	if not config.lookup then
		config.lookup = { ipython3 = "python", ipython = "python" } -- setting
	end
	M.config = config
	require("mystnb.treesitter").init(config.lookup)
end

return M
