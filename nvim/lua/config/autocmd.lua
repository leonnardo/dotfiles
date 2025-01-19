local function augroup(name)
	return vim.api.nvim_create_augroup("personal_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = augroup("hightligh_yank"),
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
-- 	command = "if mode() != 'c' | checktime | endif",
-- 	pattern = { "*" },
-- })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("json_conceal"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Augroup for copilot chat
vim.api.nvim_create_autocmd("BufEnter", {
	group = augroup("copilot_chat"),
	pattern = "copilot-*",
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
	end,
})

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- Reload aerospace config
vim.api.nvim_create_autocmd("BufWritePost", {
	group = augroup("aerospace_toml_reload"),
	pattern = "aerospace.toml",
	callback = function()
		vim.cmd("silent! !aerospace reload-config")
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = augroup("auto-project-root"),
	callback = function(args)
		if vim.api.nvim_get_option_value("buftype", { buf = args.buf }) ~= "" then
			return
		end

		local root = vim.fs.root(args.buf, function(name, path)
			local pattern = { ".git", "*.csproj", "*.sln" }
			local abspath = { vim.fn.stdpath("config") }
			local parentpath = { "~/.config" }

			return vim.iter(pattern):any(function(filepat)
				return filepat == name
			end) or vim.iter(abspath):any(function(dirpath)
				return vim.fs.normalize(dirpath) == path
			end) or vim.iter(parentpath):any(function(ppath)
				return vim.fs.normalize(ppath) == vim.fs.dirname(path)
			end)
		end)
		if root then
			vim.cmd.lcd(root)
		end
	end,
})
