-- KNAOVIM :: Neovim "1-File" Configuration (tested for upcoming 0.12)
-- by knave8
--
-- Dependencies Required:
-- 0) Patched Terminal Font (i.e. Nerd Font)
-- 1) git
-- 2) lazygit
-- 3) ripgrep
-- 4) mason dependencies (curl,tar,unzip,gzip)
--    a) Install Language Servers with :Mason (c compiler dependency)
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
    scrolloff = 0,        -- minimum lines to keep before scrolling the window
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
--
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>')
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<M-h>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<M-l>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<M-j>", ":resize +1<CR>")
vim.keymap.set("n", "<M-k>", ":resize -1<CR>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "J", "L")
vim.keymap.set("n", "K", "H")
vim.keymap.set("n", "H", "0")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "0", "J")
vim.keymap.set("n", "$", "K")
vim.keymap.set('n', '<leader>q', ':bd<CR>')
vim.keymap.set('n', '<leader>ii', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>iw', ':write<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format Buffer" })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = "Show Line Diagnostic" })
vim.keymap.set('n', '<leader>,,', ':cd ~/AppData/Local/nvim<CR>')

--
-- Plugins (lazy.nvim)
--
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
--
-- Generic Plugins
--
        { -- colorscheme
            "scottmckendry/cyberdream.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd([[colorscheme cyberdream]])
            end
        },
        { -- whichkey
            "folke/which-key.nvim",
            event = "VeryLazy",
            config = function()
                require("which-key").setup({
                    require("which-key").add({
                        { '<leader>q', desc = '[q]uit buffer' },
                        { '<leader>g', group = '[g]it' },
                        { '<leader>l', group = '[l]sp functions' },
                        { '<leader>t', group = '[t]ray toggles' },
                        { '<leader>f', group = '[f]ind something' },
                        { '<leader>n', group = '[n]nn/oil' },
                        { '<leader>i', group = '[i]nteract' },
                        { '<leader>,', group = '[Force Dir Change]' },
                    })
                })
            end
        },
        { -- oil.nvim
            "stevearc/oil.nvim",
            lazy = false,
            opts = {}, -- automatically calls require("oil").setup()
            keys = {
                { "<leader>no", "<cmd>Oil<cr>", desc = "Oil" }
            },
        },
        { -- lazygit
            "kdheepak/lazygit.nvim",
            lazy = true,
            cmd = {
                "LazyGit",
                "LazyGitConfig",
                "LazyGitCurrentFile",
                "LazyGitFilter",
                "LazyGitFilterCurrentFile",
            },
            -- setting the keybinding for LazyGit with 'keys' is recommended in
            -- order to load the plugin when the command is run for the first time
            keys = {
                { "<leader>gs", "<cmd>LazyGit<cr>", desc = "LazyGit" },
                { "<leader>gl", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Log" },
            },
        },
        { -- nvim autopairs
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {},
        },
        { -- colorizer
            "norcalli/nvim-colorizer.lua",
            lazy = true,
            cmd = {
                "ColorizerToggle",
            },
            opts = {},
            keys = {
                { "<leader>ic", "<cmd>ColorizerToggle<CR>", desc = "Toggle [c]olorizer" },
            },
        },
        { -- git-blame
            "f-person/git-blame.nvim",
            lazy = true,
            opts = {
                enabled = false,
            },
            keys = {
                { "<leader>gb", "<cmd>GitBlameToggle<CR>", desc = "Toggle Git[b]lame" }
            },
        },
--
-- 'Mini' Plugins
--
        { -- mini.icons
            "echasnovski/mini.icons",
            lazy = false,
            config = function()
                require("mini.icons").mock_nvim_web_devicons()
            end
        },
        { -- mini.pick
            "echasnovski/mini.pick",
            lazy = true,
            cmd = {
                "Pick"
            },
            dependencies = {
                "echasnovski/mini.icons",
            },
            opts = {},
            keys = {
                { '<leader>ff', ':Pick files<CR>', desc = 'Pick Files' },
                { '<leader>fh', ':Pick help<CR>', desc = 'Pick Help' },
                { '<leader>fb', ':Pick buffers<CR>', desc = 'Pick Buffers' },
                { '<leader>fg', ':Pick grep<CR>', desc = 'Pick Grep' },
                { '<leader>fs', ':Pick grep_live<CR>', desc = 'Live Find' },
            },
        },
        { -- mini.git
            "echasnovski/mini-git",
            lazy = false,
            config = function()
                require("mini.git").setup()
            end
        },
        { -- mini.diff
            "echasnovski/mini.diff",
            lazy = false,
            opts = {
                view = {
                    style = 'sign',
                    signs = {
                        add = '+',
                        change = '!',
                        delete = '_',
                    }
                }
            },
        },
        { -- mini.statusline
            "echasnovski/mini.statusline",
            lazy = false,
            config = function()
                require("mini.statusline").setup({
                    use_icons = true
                })
                ---@diagnostic disable-next-line: duplicate-set-field
                require("mini.statusline").section_location = function()
                    return '%2l:%-2v'
                end
            end
        },
--
-- Additional Plugins (usually dependent on above or complex)
--
        { -- nvim-tree
            "nvim-tree/nvim-tree.lua",
            lazy = true,
            cmd = {
                "NvimTreeToggle",
            },
            dependencies = {
                "echasnovski/mini.icons",
            },
            opts = {},
            keys = {
                { "<leader>tt", "<CMD>NvimTreeToggle<CR>", desc = "Toggle File[t]ree" },
            },
        },
        { -- todo-comments
            "folke/todo-comments.nvim",
            lazy = false,
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            opts = {},
            keys = {
                { "<leader>ft", "<CMD>TodoQuickFix<CR>", desc = "Show [t]odos" },
            },
        },
        { -- treesitter
            "https://github.com/nvim-treesitter/nvim-treesitter",
            lazy = false,
            config = function()
                ---@diagnostic disable-next-line: missing-fields
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { 'lua', 'luadoc', 'vim', 'vimdoc', 'bash' },
                    highlight = { enable = true }
                })
            end,
        },
        { -- knowledge management with Obsidian 
            "epwalsh/obsidian.nvim",
            version = "*",
            lazy = true,
            ft = "markdown",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            opts = {
                workspaces = {
                    {
                        name = "knowledge",
                        path = "~/Documents/knowledge"
                    },
                },
                daily_notes = {
                    folder = "daily-tracking",
                    date_format = "%Y%m%d",
                    alias_format = "%B %d, %Y",
                },
                mappings = {
                    -- toggle check boxes
                    ["<leader>oc"] = {
                        action = function()
                            return require("obsidian").util.toggle_checkbox()
                        end,
                        opts = { buffer = true },
                    },
                },


                -- Optional, customize how note IDs are generated given an optional title.
                ---@param title string|?
                ---@return string
                note_id_func = function(title)
                    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                    -- In this case a note with the title 'My new note' will be given an ID that looks
                    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                    local suffix = ""
                    if title ~= nil then
                        -- If title is given, transform it into valid file name.
                        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                    else
                        -- If title is nil, just add 4 random uppercase letters to the suffix.
                        for _ = 1, 4 do
                            suffix = suffix .. string.char(math.random(65, 90))
                        end
                    end
                    return tostring(os.date("%Y%m%d%H%M")) .. "-" .. suffix
                end,
            },
            keys = {
                {"<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Notes" },
                {"<leader>ot", "<cmd>ObsidianTags<CR>", desc = "Search by Tag" },
                {"<leader>oT", "<cmd>ObsidianNewFromTemplate<CR>", desc = "Note from Template" },
                {"<leader>oi", "<cmd>ObsidianTemplate<CR>", desc = "Insert Template" },
                {"<leader>on", "<cmd>ObsidianNew<CR>", desc = "New Note" },
                {"<leader>od", "<cmd>ObsidianToday<CR>", desc = "Open Daily Note" },
                {"<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", desc = "Open Note by Name" },
                {"<leader>ow", "<cmd>ObsidianWorkspace<CR>", desc = "Switch Workspace" },
            },
        },
        { -- completion stack
            "https://github.com/saghen/blink.cmp",
            lazy = false,
            dependencies = {
                "https://github.com/L3MON4D3/LuaSnip",
            },
            config = function ()
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
            end,
        },
        { -- lsp stack
            "https://github.com/neovim/nvim-lspconfig",
            lazy = false,
            dependencies = {
                { "https://github.com/mason-org/mason.nvim", opts = {}  }
            },
            config = function()
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
            end,
        },
        { -- local plugin dev WIMS.NVIM
            dir = "~/Projects/wims.nvim"
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    rocks = { enabled = false },
    -- automatically check for plugin updates
    checker = { enabled = false },
})

