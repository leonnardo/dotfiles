return {
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle", -- optional for lazy loading on command
		cond = false,
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		opts = {
			--
			-- All of these are just the defaults
			--
			enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
			trigger_events = { -- See :h events
				-- -- vim events that trigger an immediate save
				-- immediate_save = { "BufLeave", "FocusLost" },
				-- -- I'm disabling this, as it's autosaving when I leave the buffer and
				-- -- that's autoformatting stuff if on insert mode and following a tutorial
				immediate_save = { nil },
				defer_save = { "InsertLeave" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
				cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
			},
			-- function that takes the buffer handle and determines whether to save the current buffer or not
			-- return true: if buffer is ok to be saved
			-- return false: if it's not ok to be saved
			-- if set to `nil` then no specific condition is applied
			condition = function(buf)
				local fn = vim.fn
				local utils = require("auto-save.utils.data")
				-- don't save for `sql` file types
				-- I do this so when working with dadbod the file is not saved every time
				-- I make a change, and a SQL query executed
				-- Run `:set filetype?` on a dadbod query to make sure of the filetype
				if utils.not_in(fn.getbufvar(buf, "&filetype"), { "mysql" }) then
					return true
				end
				return false
			end,
			write_all_buffers = false, -- write all buffers when the current one meets `condition`
			-- Do not execute autocmds when saving
			-- This is what fixed the issues with undo/redo that I had
			-- https://github.com/okuuva/auto-save.nvim/issues/55
			-- Issue in original plugin
			-- https://github.com/pocco81/auto-save.nvim/issues/70
			noautocmd = true,
			lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
			-- delay after which a pending save is executed (default 1000)
			debounce_delay = 500,
			-- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
			debug = false,
		},
	},
}
