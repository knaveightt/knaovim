return {
    "ibhagwan/fzf-lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        {"<leader>ff", "<cmd>FzfLua files<CR>", desc="find [f]iles"}, 
        {"<leader>fb", "<cmd>FzfLua buffers<CR>", desc="find [b]uffers"}, 
        {"<leader>fS", "<cmd>FzfLua grep<CR>", desc="grep [S]earch"}, 
        {"<leader>fs", "<cmd>FzfLua live_grep<CR>", desc="live [g]rep"}, 
        {"<leader>fgc", "<cmd>FzfLua git_commits<CR>", desc="find git [c]ommits"}, 
        {"<leader>fgC", "<cmd>FzfLua git_bcommits<CR>", desc="buffer [C]ommits"}, 
        {"<leader>fh", "<cmd>FzfLua helptags<CR>", desc="find [h]elp"}, 
        {"<leader>f?", "<cmd>FzfLua builtin<CR>", desc="[?]see all"}, 
    },
}
