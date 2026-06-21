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
        { "<leader>ie", "<CMD>NvimTreeToggle<CR>", desc = "toggle filetre[e]" },
    },
}
