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
    use "EdenEast/nightfox.nvim"
    --use "marko-cerovac/material.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "kyazdani42/nvim-web-devicons"
    use { "nvim-lualine/lualine.nvim", config = get_setup("lualine"), event = "VimEnter", requires = { "kyazdani42/nvim-web-devicons", opt = true }, }
    --use { "feline-nvim/feline.nvim", config = get_setup("feline") }


    -- LSP Plugins
    use { "neovim/nvim-lspconfig", requires = { "williamboman/nvim-lsp-installer" }, config = get_setup("lsp") }
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
      config = get_setup("cmp"),
    }
    use { "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } }
    use { "L3MON4D3/LuaSnip", requires = { "rafamadriz/friendly-snippets"} }
    use { "nvim-treesitter/nvim-treesitter", config = get_setup("treesitter"), run = ":TSUpdate", }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use { "ray-x/go.nvim", config = get_setup("go-nvim") }
    use { "tjdevries/nlua.nvim"  } -- add fucking config


    -- Navigation
    use{ "nvim-telescope/telescope.nvim", module = "telescope", cmd = "Telescope", requires = { { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim" },
      },
      config = get_setup("telescope"),
    }
    use { "kyazdani42/nvim-tree.lua", config = get_setup("nvim-tree") }
    use { "nvim-telescope/telescope-file-browser.nvim" }

    -- Misc
    use {"windwp/nvim-autopairs", config = get_setup("autopairs") }
    use { "tpope/vim-surround" }
    use { "numToStr/Comment.nvim", config = get_setup("comment") }
    use { "folke/which-key.nvim", config = get_setup("whichkey") }

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
