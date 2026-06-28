vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap

-- leader keybinds
keymap.set('n', '<leader>w', "<C-w>")
keymap.set('n', '<leader>q', ':bp | bd #<CR>', {desc = '[q]uit buffer'})
keymap.set('n', '<leader>bd', ':bd<CR>', {desc="[d]elete buffer"})
keymap.set('n', '<leader>bq', ':bp | bd #<CR>', {desc = 'soft [q]uit buffer'})
keymap.set('n', '<leader>bw', ':write<CR>', {desc="[w]rite buffer"})
keymap.set('n', '<leader>bs', ':update<CR>:source<CR>', {desc="[r]un buffer"})
keymap.set("n", "<leader>bl", ":ls<cr>:b<Space>", {desc="[l]ist buffers"})

-- split management
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<M-h>", ":vertical resize -1<CR>")
keymap.set("n", "<M-l>", ":vertical resize +1<CR>")
keymap.set("n", "<M-j>", ":resize +1<CR>")
keymap.set("n", "<M-k>", ":resize -1<CR>")

-- tab management
keymap.set("n", "[t", ":tabprevious<CR>")
keymap.set("n", "]t", ":tabNext<CR>")

-- lsp keys
keymap.set('n', '<leader>ld', vim.lsp.buf.definition, {desc="show [d]efinition"})
keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, {desc="show [d]eclaration"})
keymap.set('n', '<leader>lK', vim.lsp.buf.hover, {desc="show [K] info"})
keymap.set('n', '<leader>li', vim.lsp.buf.implementation, {desc="show [i]mplementation"})
keymap.set('n', '<leader>lR', vim.lsp.buf.rename, {desc="re[n]ame"})
keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, {desc="show [t]ype definition"})
keymap.set('n', '<leader>la', vim.lsp.buf.code_action, {desc="show code [a]ction"})
keymap.set('n', '<leader>lr', vim.lsp.buf.references, {desc="show [r]eferences"})
keymap.set('n', '<leader>ll', vim.diagnostic.open_float, {desc="show [l]ine diagnostic"})
keymap.set('n', '<leader>lF', vim.lsp.buf.format, {desc="[F]ormat buffer"})

-- visual mode tweaks
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("x", "v", "vv") -- cancel V-Line be pressing v
keymap.set("x", "V", "j0") -- keep using Shift+v to select more lines

-- normal mode tweaks
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set('n', '<ESC>', ':nohlsearch<CR>')
keymap.set('n', "M", "M0")

local function is_at_bottom()
    local win = 0
    local cursor_screen_row = vim.fn.screenrow()
    local window_height = vim.fn.winheight(win)
    if cursor_screen_row-1 == window_height then -- -1 for bufferline
        return true
    else
        return false
    end
end

keymap.set("n", "H", function() -- smart H key
    if vim.fn.screenrow() == 2 then -- 2 because of bufferline
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-u>', true, false, true), 'n', false)
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('H0', true, false, true), 'n', false)
end, { desc = "smart-shift cursor and view upwards"})

keymap.set("n", "L", function() -- smart L key
    --print("screenrow:" .. vim.fn.screenrow() .. " winheight:" .. vim.fn.winheight(0) .. " " .. tostring(is_at_bottom())) -- for debug
    if is_at_bottom() then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-d>', true, false, true), 'n', false)
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('L0', true, false, true), 'n', false)
end, { desc = "smart-shift cursor and view downwards"})
