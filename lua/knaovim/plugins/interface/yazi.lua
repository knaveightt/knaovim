return {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        { "<leader>iy", "<CMD>Yazi<CR>", desc = "open [y]azi" },
        { "<leader>iY", "<CMD>Yazi cwd<CR>", desc = "[Y]azi cwd" },
    },
    opts = {
        open_for_directories=true,
        keymaps = {
            show_help = "<f1>",
        },
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
}
