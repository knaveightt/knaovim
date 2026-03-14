return {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
        { "<leader>ft", "<CMD>TodoFzfLua<CR>", desc = "find [t]odos/comments" },
    },
}
