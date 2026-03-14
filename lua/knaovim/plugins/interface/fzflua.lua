return {
    "ibhagwan/fzf-lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        {"<leader>ff", "<cmd>FzfLua files<CR>", desc="find [f]iles"}, 
        {"<leader>fb", "<cmd>FzfLua buffers<CR>", desc="find [b]uffers"}, 
        {"<leader>fG", "<cmd>FzfLua grep<CR>", desc="[G]rep search"}, 
        {"<leader>fg", "<cmd>FzfLua live_grep<CR>", desc="live [g]rep"}, 
        {"<leader>fh", "<cmd>FzfLua helptags<CR>", desc="find [h]elp"}, 
        {"<leader>f?", "<cmd>FzfLua builtin<CR>", desc="[?]see all"}, 
        {"<leader>gfl", "<cmd>FzfLua git_commits<CR>", desc="git commit [l]og"}, 
        {"<leader>gfc", "<cmd>FzfLua git_bcommits<CR>", desc="buffer [C]ommits"}, 
        {"<leader>gfs", "<cmd>FzfLua git_status<CR>", desc="git [s]tatus search"}, 
    },
}
