local fn = vim.fn
-------------------------
-- Auto install packer (BOILERPLATE)
-------------------------
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
    ]]

-- Use a protected call so we dont error out onf irst use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-------------------------
-- PLUGINS SECTION
-------------------------
return packer.startup(function(use)
    -- Boilerplate plugins
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -- Colorscheme
    use "morhetz/gruvbox"

    -- Cmp (completion)
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- Vim wiki
    use "vimwiki/vimwiki"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"

    -- Autopairs
    use "windwp/nvim-autopairs"

    -- Comments
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring" -- requires treesitter

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- nvim tree
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"

    -- bufferline
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"

    -- toggleterm
    use "akinsho/toggleterm.nvim"

    -- lualine
    use "nvim-lualine/lualine.nvim"

    -- Auto set up config after cloning packer.nvim
    -- Put at end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

