return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump({
            search = {
                max_length = 1,
                -- Custom function prefixing the search string with a word-boundary anchor
                mode = function(str)
                    return "\\<" .. str
                end,
            },
            jump = {
                autojump = true,
            },
        }) end, desc = "Flash to Word" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
