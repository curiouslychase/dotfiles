return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    local on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    require("typescript-tools").setup({
      on_attach = on_attach,
      settings = {
        tsserver_plugins = {
          "@effect/language-service",
        },
      },
    })
  end,
}
