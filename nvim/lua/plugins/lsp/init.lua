return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  dependencies = {
    {
      "mason-org/mason.nvim",
    },
    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
      },
      config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
          ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls" },
          automatic_enable = {
            exclude = { "lua_ls" }
          }
        })
      end,
    }
  },
}