return {
	{
		"HallerPatrick/py_lsp.nvim",
		opts = {
			host_python = "/usr/sbin/python",
			default_venv_name = ".venv",
			pylsp_plugins = {
				autopep8 = {
					enabled = true,
				},
				pyls_mypy = {
					enabled = true,
				},
				pyls_isort = {
					enabled = true,
				},
				flake8 = {
					enabled = true,
				},
			},
		},
	},
}
