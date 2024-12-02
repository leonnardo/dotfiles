return {
	{
		"<C-Left>",
		require("smart-splits").move_cursor_left,
		desc = "Move to left pane",
	},
	{
		"<C-Right>",
		require("smart-splits").move_cursor_right,
		desc = "Move to right pane",
	},
	{
		"<C-Up>",
		require("smart-splits").move_cursor_up,
		desc = "Move to up pane",
	},
	{
		"<C-down>",
		require("smart-splits").move_cursor_down,
		desc = "Move to down pane",
	},
}
