return {
    "https://github.com/saghen/blink.cmp",
    lazy = false,
    dependencies = {
        "https://github.com/L3MON4D3/LuaSnip",
    },
    config = function ()
        require("luasnip").setup({
            require("luasnip.loaders.from_snipmate").lazy_load()
        })
        require("blink.cmp").setup({
            keymap = { preset = "default" },
            appearance = { nerd_font_variant = "mono" },
            -- By default, you may press `<c-space>` to show the documentation.
            completion = {
                -- Optionally, set `auto_show = true` to show the documentation after a delay.
                documentation = { auto_show = false, auto_show_delay_ms = 500 },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets' },
            },
            snippets = { preset = 'luasnip' },
            -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
            -- which automatically downloads a prebuilt binary when enabled.
            --
            -- By default, we use the Lua implementation instead, but you may enable
            -- the rust implementation via `'prefer_rust_with_warning'`
            --
            -- See :h blink-cmp-config-fuzzy for more information
            fuzzy = { implementation = 'lua' },

            -- Shows a signature help window while you type arguments for a function
            signature = { enabled = true },
        })
    end,
}
