-- KNAOVIM :: My Neovim Configuration
-- by knave8
--
-- Dependencies Required:
-- 0) Patched Terminal Font (i.e. Nerd Font)
-- 1) git and lazygit
-- 2) fzf
-- 3) treesitter dependencies
--    a) tar, curl
--    b) tree-sitter-cli
--    c) c compiler (e.g. gcc)

-- Load Core Customizations
require("knaovim.core")

-- Load Lazy.nvim plugin manager
require("knaovim.lazy")
