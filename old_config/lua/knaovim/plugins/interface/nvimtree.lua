return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = {
        "NvimTreeToggle",
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {}, -- forces running setup() function
    keys = {
        { "<leader>it", "<CMD>NvimTreeToggle<CR>", desc = "toggle file[t]ree" },
    },
}
