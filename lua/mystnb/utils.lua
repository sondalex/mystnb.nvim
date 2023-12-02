local TextTable = {}
local M = {}
function TextTable:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function TextTable:iter_tokens()
	local i = 0
	local len = #self
	return function()
		i = i + 1
		if i <= len then
			return self[i]
		end
	end
end

local Text = {}
function Text.split(str, sep)
	local result = TextTable:new()
	local regex = "([^" .. sep .. "]+)"
	local i = 1
	for each in string.gmatch(str, regex) do
		result[i] = each
		i = i + 1
	end
	return result
end

local map_language = function(language, lookup)
	if lookup[language] then
		return lookup[language]
	else
		return language
	end
end

function M.find_language_in_info_string(text, default_language, language_map)
	local lookup = language_map or {}
	local language = default_language or "python"
	local meta_start = string.find(text, "}")
	local meta_text = string.sub(text, meta_start + 1, -1)
	local m = Text.split(meta_text, "%s")
	if #m > 0 then
		language = m[1]
		language = map_language(language, lookup)
	end
	local filelanguage, _ = vim.filetype.match({ filename = "file." .. language })
	return filelanguage or language
end

return M
