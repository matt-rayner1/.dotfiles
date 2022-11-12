---------------------
-- setup/boilerplate
---------------------
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

---------------------
-- leader key
---------------------
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---------------------
-- MODE LIST
---------------------
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


---------------------
-- non-addon keybinds
---------------------

-- bad habit prevention
keymap("n", "<Left>", ':echoe "Use h"<CR>', opts)
keymap("n", "<Right>", ':echoe "Use l"<CR>', opts)
keymap("n", "<Up>", ':echoe "Use k"<CR>', opts)
keymap("n", "<Down>", ':echoe "Use j"<CR>', opts)
keymap("i", "<Left>", '<ESC>:echoe "Use h"<CR>', opts)
keymap("i", "<Right>", '<ESC>:echoe "Use l"<CR>', opts)
keymap("i", "<Up>", '<ESC>:echoe "Use k"<CR>', opts)
keymap("i", "<Down>", '<ESC>:echoe "Use j"<CR>', opts)

-- buffer switching
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- better window switching
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- better window resize
keymap("n", "<C-Up>", ":resize +1<CR>", opts)
keymap("n", "<C-Down>", ":resize -1<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)

-- wrapping toggle
keymap("n", "<leader>ra", ":set wrap!<CR>", opts)

-- stay in visual selection after indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- open netrw (file explorer)
keymap("n", "<leader>e", ":Lex 25<cr>", opts)

-- move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>h", term_opts)

-- delete/change in word automatically
-- TODO

-- Telescope keybinds
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
