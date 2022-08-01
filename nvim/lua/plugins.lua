vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

vim.api.nvim_command("packadd packer.nvim")

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_setup(name)
  return string.format('require("config/%s")', name)
end

return require("packer").startup{
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- Post-install/update hook with neovim command

    -- Appearence
    use { "lukas-reineke/indent-blankline.nvim" }
    use "kyazdani42/nvim-web-devicons"

    -- Colorschemes
    use "EdenEast/nightfox.nvim"
    use "christianchiarulli/nvcode-color-schemes.vim"
    use 'Th3Whit3Wolf/one-nvim'
    use "rebelot/kanagawa.nvim"
    use "marko-cerovac/material.nvim"
    use "ellisonleao/gruvbox.nvim"
    use 'tiagovla/tokyodark.nvim'
    use 'folke/tokyonight.nvim'
    use ({'catppuccin/nvim', as = 'catppuccin'})
    use 'fenetikm/falcon'

    -- Statusline
    use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true }, }

    -- LSP Plugins
    use { "neovim/nvim-lspconfig", requires = { "williamboman/nvim-lsp-installer" } }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "saadparwaiz1/cmp_luasnip" },
      },
    }
    use { "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } }
    use { "L3MON4D3/LuaSnip", requires = { "rafamadriz/friendly-snippets"} }
    use { "folke/trouble.nvim" }
    use { "glepnir/lspsaga.nvim" }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use { "p00f/nvim-ts-rainbow"}
    use { "ray-x/go.nvim" }
    use { "ray-x/guihua.lua" }
    use { "tjdevries/nlua.nvim"  } -- add fucking config
    use { "hashivim/vim-terraform" }

    -- Debug Adapter Procotol
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "leoluz/nvim-dap-go"
    use {"mfussenegger/nvim-dap", config = function() require('config.dap').setup() end}


    -- Navigation
    use{ "nvim-telescope/telescope.nvim", module = "telescope", cmd = "Telescope", requires = { { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim" },
      },
      config = get_setup("telescope"),
    }
    use "nvim-telescope/telescope-ui-select.nvim"
    use { "kyazdani42/nvim-tree.lua" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "aserowy/tmux.nvim" }
    use { 'https://gitlab.com/yorickpeterse/nvim-pqf.git' }

    -- Git
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- Misc
    use {"windwp/nvim-autopairs" }
    use { "tpope/vim-surround" }
    use { "numToStr/Comment.nvim" }
    use { "folke/which-key.nvim" }
    use {"akinsho/toggleterm.nvim", tag = 'v1.*' }
    use { "Pocco81/AutoSave.nvim" }

    -- Fun
    use { "ThePrimeagen/vim-be-good" }

    --    use({ "Shatur/neovim-session-manager", config = get_setup("session") })


    if Packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
  },
}
