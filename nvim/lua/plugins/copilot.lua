local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",

	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				auto_trigger = true,
				debounce = 50,
				keymap = {
					accept = "<C-y>",
				},
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		lazy = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			show_help = true, -- Show help actions
			window = {
				layout = "float",
			},
			question_header = "  " .. vim.env.USER or "User" .. " ",
			answer_header = "  Copilot ",
			auto_follow_cursor = true, -- Don't follow the cursor after getting response
			auto_insert_mode = true,
			selection = function(source)
				local select = require("CopilotChat.select")
				return select.visual(source) or select.buffer(source)
			end,
			mappings = {
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-CR>",
				},
			},
		},
		keys = {
			{
				"<leader>tct",
				function()
					local chat = require("CopilotChat")
					chat.toggle({
						window = {
							layout = "vertical",
						},
					})
				end,
				desc = "Toggle vertical split",
			},
			{
				"<leader>tci",
				function()
					local chat = require("CopilotChat")
					chat.open({
						window = {
							layout = "float",
							relative = "cursor",
							width = 0.5,
							height = 0.2,
							row = 1,
							col = 0,
						},
					})
				end,
				desc = "Inline chat",
			},
		},
	},
}
