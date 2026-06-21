-- KNAOVIM :: My Neovim Configuration
-- by knave8
--
-- Dependencies Required:
-- 0) Patched Terminal Font (i.e. Nerd Font)
-- 1) git and lazygit
-- 2) fzf
-- 2b) yazi
-- 3) treesitter dependencies
--    a) tar, curl
--    b) tree-sitter-cli, associated libs
--    c) c compiler (e.g. gcc)
-- 4) LSP Server Installs
--    a) Run :Mason and install required LSP servers
--    b) e.g. python-lsp-server, lua-lsp-server

-- Load Core Customizations
require("knaovim.core")

-- Load Lazy.nvim plugin manager
require("knaovim.lazy")
