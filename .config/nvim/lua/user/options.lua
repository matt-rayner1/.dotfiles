-- :help options

local options = {

    -- file options
    backup = false,
    swapfile = true,
    undofile = true,
    writebackup = false,

    -- clipboard options
    clipboard = "unnamedplus",

    -- tab options
    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    backspace = {"indent", "eol", "start"},
    showtabline = 2,
    smartindent = true,

    -- line numbering options
    signcolumn = "yes",
    number = true,
    relativenumber = true,
    numberwidth = 4,
    laststatus = 2,

    -- scrolling options
    scrolloff = 15,
    sidescrolloff = 10,

    -- search options
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,

    -- window options
    splitbelow = true,
    splitright = true,

    -- visual options
    termguicolors = false,
    cursorline = false,
    wrap = false,
    guifont = "tamzen:h17",
    -- guifont = "monospace:h17",
    -- colorscheme = "gruvbox",

    -- timing options
    timeoutlen = 1000,
    updatetime = 300,

    -- misc settings
    cmdheight = 2,
    pumheight = 10,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    mouse = "a",
    showmode = false,

    -- status line

}

-- shortmess options
vim.opt.shortmess:append "c"
vim.opt.shortmess:append "I"

-- misc append options
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd "colorscheme gruvbox"

for k, v in pairs(options) do
	vim.opt[k] = v
end
