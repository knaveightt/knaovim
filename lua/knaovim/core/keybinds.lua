vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap

keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<M-h>", ":vertical resize -1<CR>")
keymap.set("n", "<M-l>", ":vertical resize +1<CR>")
keymap.set("n", "<M-j>", ":resize +1<CR>")
keymap.set("n", "<M-k>", ":resize -1<CR>")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set('n', '<ESC>', ':nohlsearch<CR>')

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set('n', '<leader>w', "<C-w>")
keymap.set('n', '<leader>bd', ':bd<CR>', {desc="[d]elete buffer"})
keymap.set('n', '<leader>bq', ':bp | bd #<CR>', {desc = 'soft [q]uit buffer'})
keymap.set('n', '<leader>bw', ':write<CR>', {desc="[w]rite buffer"})
keymap.set('n', '<leader>br', ':update<CR>:source<CR>', {desc="[r]un buffer"})
keymap.set("n", "<leader>bl", ":ls<cr>:b<Space>", {desc="[l]ist buffers"})
keymap.set('n', '<leader>lf', vim.lsp.buf.format, {desc="[f]ormat buffer"})
keymap.set('n', '<leader>ld', vim.diagnostic.open_float, {desc="show line [d]iagnostic"})

