return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = {
			"css",
			"javascript",
		},
		user_default_options = {
			AARRGGBB = true,
		},
	},
}
