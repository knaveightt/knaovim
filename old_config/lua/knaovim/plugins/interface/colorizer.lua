return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    cmd = {
        "ColorizerToggle",
    },
    opts = {},
    keys = {
        { "<leader>ic", "<cmd>ColorizerToggle<CR>", desc = "Toggle [c]olorizer" },
    },
}
