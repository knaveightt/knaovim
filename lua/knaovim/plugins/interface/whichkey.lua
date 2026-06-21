return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            require("which-key").add({
                { '<leader>w', group = '[w]indow actions' },
                { '<leader>b', group = '[b]uffer actions' },
                { '<leader>l', group = '[l]sp actions' },
                -- { '<leader>g', group = '[g]it actions' },
                -- { '<leader>gf', group = '[f]ind something' },
                -- { '<leader>lf', group = '[f]ind something' },
                -- { '<leader>i', group = '[i]nterface actions' },
                -- { '<leader>f', group = '[f]ind something' },
                -- { '<leader>n', group = '[n]nn/oil' },
            })
        })
    end
}
