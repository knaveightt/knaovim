return {
    "EdenEast/nightfox.nvim",
    priority = 1000, -- Make sure to load this before all other plugins
    config = function()
        -- Optional: configure nightfox settings here
        require("nightfox").setup({
            options = {
                -- Example: Set styles for different syntax groups
                styles = {
                    comments = "italic",
                    keywords = "bold",
                },
                dim_inactive = true, -- Dim inactive windows
            },
        })

        -- Load the colorscheme
        vim.cmd("colorscheme carbonfox") -- You can also use 'dayfox', 'dawnfox', 'duskfox', 'nordfox', or 'terafox'
    end,
}
