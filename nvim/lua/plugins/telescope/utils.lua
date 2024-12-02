local telescope = require("telescope")
local utils = require("telescope.utils")

local M = {}

M.filename_first = function(opts, path)
	local tail = utils.path_tail(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s\t\t[%s]", tail, parent)
end

return M
