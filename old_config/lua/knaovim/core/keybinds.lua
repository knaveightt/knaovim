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
keymap.set('n', "M", "M0")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("x", "V", "j0") -- keep using Shift+v to select more lines

local function is_at_bottom()
    local win = 0
    local cursor_screen_row = vim.fn.screenrow()
    local window_height = vim.fn.winheight(win)
    if cursor_screen_row-1 == window_height then
        return true
    else
        return false
    end
end

keymap.set("n", "H", function()
    if vim.fn.screenrow() == 2 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-u>', true, false, true), 'n', false)
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('H0', true, false, true), 'n', false)
end, { desc = "smart-shift cursor and view upwards"})

keymap.set("n", "L", function()
    if is_at_bottom() then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-d>', true, false, true), 'n', false)
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('L0', true, false, true), 'n', false)
end, { desc = "smart-shift cursor and view downwards"})

keymap.set('n', '<leader>w', "<C-w>")
keymap.set('n', '<leader>q', ':bp | bd #<CR>', {desc = '[q]uit buffer'})
keymap.set('n', '<leader>bd', ':bd<CR>', {desc="[d]elete buffer"})
keymap.set('n', '<leader>bq', ':bp | bd #<CR>', {desc = 'soft [q]uit buffer'})
keymap.set('n', '<leader>bw', ':write<CR>', {desc="[w]rite buffer"})
keymap.set('n', '<leader>br', ':update<CR>:source<CR>', {desc="[r]un buffer"})
keymap.set("n", "<leader>bl", ":ls<cr>:b<Space>", {desc="[l]ist buffers"})
keymap.set('n', '<leader>lF', vim.lsp.buf.format, {desc="[F]ormat buffer"})
keymap.set('n', '<leader>ll', vim.diagnostic.open_float, {desc="show [l]ine diagnostic"})

