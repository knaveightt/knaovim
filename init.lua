-- KNAOVIM :: Neovim "1-File" Configuration (0.12+)
-- by knave8
--
-- Dependencies Required:
-- 0) Patched Terminal Font (i.e. Nerd Font)
-- 1) git
-- 2) lazygit
-- 3) ripgrep
-- 4) nnn
-- 5) mason dependencies (curl,tar,unzip,gzip)
--    a) Install Language Servers with :Mason
--       - lua_language_server
--    b) Ensure it is enabled in the "Lua" section at the end

--
-- General Options
--
local options = {
    mouse = 'a',          -- mouse support (try resizing splits)
    showmode = false,     -- dont show the -- Insert -- message
    breakindent = true,   -- maintain indents on line breaks
    undofile = true,      -- save undo files
    backup = false,       -- no backup file
    swapfile = false,     -- no swap file use
    ignorecase = true,    -- ignore cases for searching
    smartcase = true,     -- case-insensitive unless cases are used
    hlsearch = true,      -- highlight matches when searching
    splitbelow = true,    -- force splits below
    splitright = true,    -- force v splits to the right
    termguicolors = true, -- plugins require this to allow correct colors
    signcolumn = 'yes',   -- always show sign column
    number = true,        -- show line numbers
    list = true,          -- how to display whitespace in editor
    listchars = { tab = '» ', trail = '·', nbsp = '␣' },
    inccommand = 'split', -- show substitutions live in a split
    cursorline = true,    -- show which line the cursor is on
    scrolloff = 8,        -- minimum lines to keep before scrolling the window
    expandtab = true,     -- convert tabs to spaces
    autoindent = true,    -- automatically indent based on previous line
    shiftwidth = 4,       -- autoindents will be 4 spaces
    tabstop = 4,          -- make tabs 4 spaces long
    numberwidth = 3,      -- width of line number column
    wrap = false,         -- show long lines without wrapping
    conceallevel = 2,     -- set conceal level, primarily for markdown
    foldlevelstart = 99,  -- sets the starting state of folds as unfolded
    updatetime = 50,      -- speed up updates (like lsp)
    colorcolumn = "80",   -- color the 80th column
    winborder = "rounded" -- rounded floating window border
}
for k, v in pairs(options) do
    vim.opt[k] = v
end

--
-- Keybinds
--
vim.g.mapleader = " "
vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>')
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<M-h>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<M-l>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<M-j>", ":resize +1<CR>")
vim.keymap.set("n", "<M-k>", ":resize -1<CR>")
vim.keymap.set('n', '<leader>q', ':bd<CR>')
vim.keymap.set('n', '<leader>ii', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>iw', ':write<CR>')
vim.keymap.set('n', '<leader>ic', ':ColorizerToggle<CR>')
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tn', ':NnnExplorer<CR>')
vim.keymap.set('n', '<leader>nn', ':NnnPicker<CR>')
vim.keymap.set('n', '<leader>no', ':Oil<CR>')
vim.keymap.set('n', '<leader>gs', ':LazyGit<CR>')
vim.keymap.set('n', '<leader>gl', ':LazyGitFilter<CR>')
vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format Buffer" })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = "Show Line Diagnostic" })
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<leader>fh', ':Pick help<CR>')
vim.keymap.set('n', '<leader>fb', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>fg', ':Pick grep<CR>')
vim.keymap.set('n', '<leader>fs', ':Pick grep_live<CR>')
vim.keymap.set('n', '<leader>ft', ':TodoQuickFix<CR>')
vim.keymap.set('n', '<leader>fw', ':WimsInsertSymbol<CR>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--
-- Plugins
--
vim.pack.add({
    { src = "https://github.com/scottmckendry/cyberdream.nvim"},
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/luukvbaal/nnn.nvim" },
    { src = "https://github.com/kdheepak/lazygit.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/norcalli/nvim-colorizer.lua" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    { src = "https://github.com/f-person/git-blame.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/mason-org/mason.nvim" },
    -- mini suite
    { src = "https://github.com/echasnovski/mini.icons" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/echasnovski/mini.diff" },
    { src = "https://github.com/echasnovski/mini-git" },
    { src = "https://github.com/echasnovski/mini.statusline" },
    -- things for todo-comments
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/folke/todo-comments.nvim" },
})

--
-- Plugin Setup...
--
require("oil").setup()
require("nnn").setup()
require("nvim-autopairs").setup()
require("colorizer").setup()
require("which-key").setup({
    require("which-key").add({
        { '<leader>q', desc = '[q]uit buffer' },
        { '<leader>g', group = '[g]it' },
        { '<leader>l', group = '[l]sp functions' },
        { '<leader>t', group = '[t]ray toggles' },
        { '<leader>f', group = '[f]ind something' },
        { '<leader>n', group = '[n]nn/oil' },
        { '<leader>i', group = '[i]nteract' },
    })
})
require("todo-comments").setup()
-- Comments Available:
-- TODO
-- HACK
-- WARN
-- PERF
-- NOTE
-- TEST
require("gitblame").setup({
    enabled = false
})
require("mini.icons").setup({
    require("mini.icons").mock_nvim_web_devicons()
})
require("mini.pick").setup()
require("mini.git").setup()
require("mini.diff").setup({
    view = {
        style = 'sign',
        signs = {
            add = '+',
            change = '!',
            delete = '_',
        }
    }
})
require("mini.statusline").setup({
    use_icons = true
})
---@diagnostic disable-next-line: duplicate-set-field
require("mini.statusline").section_location = function()
    return '%2l:%-2v'
end
require("nvim-tree").setup()
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
    ensure_installed = { 'lua', 'luadoc', 'vim', 'vimdoc', 'bash' },
    highlight = { enable = true }
})
require("luasnip").setup({
    require("luasnip.loaders.from_snipmate").lazy_load()
})
require("blink.cmp").setup({
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    -- By default, you may press `<c-space>` to show the documentation.
    completion = {
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets' },
    },
    snippets = { preset = 'luasnip' },
    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = 'lua' },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
})
require("mason").setup()

--
-- LSP
--
vim.lsp.enable({ "lua_ls" })
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

--
-- Finally...
--
require("wims").setup() -- developing this plugin locally
vim.cmd("colorscheme cyberdream")
