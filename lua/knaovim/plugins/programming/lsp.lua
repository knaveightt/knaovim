return { -- lsp stack
    "https://github.com/neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        { "https://github.com/mason-org/mason.nvim", opts = {}  },
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        vim.lsp.enable({ "lua_ls", "pylsp" })
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    }
                }
            }
        })
    end,
}
