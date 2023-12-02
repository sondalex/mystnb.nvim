local utils = require("mystnb.utils")
local mystnb = require("mystnb")
mystnb.setup()
local lookup = mystnb.config.lookup

describe("detect language", function()
	local function test_detect_language(info_string, expected_language)
		local language = utils.find_language_in_info_string(info_string, "python", lookup)
		assert.are.equal(expected_language, language)
	end

	it("python with python tag", function()
		test_detect_language("{code-cell} python", "python")
	end)
	it("python with ipython3 tag", function()
		test_detect_language("{code-cell} ipython3", "python")
	end)
end)
