return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            require("which-key").add({
                { '<leader>w', group = '[w]indow actions' },
                { '<leader>b', group = '[b]uffer actions' },
                { '<leader>l', group = '[l]sp actions' },
                { '<leader>i', group = '[i]nteract' },
                { '<leader>f', group = '[f]ind something' },
                { '<leader>g', group = '[g]it actions' },
                { '<leader>gf', group = '[f]ind something' },
                -- { '<leader>lf', group = '[f]ind something' },
            })
        })
    end
}
