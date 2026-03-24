return {
  -- treesitter parser for templ syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "templ",
      },
    },
  },

  -- LSP: templ, html, tailwindcss
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        templ = {},
        html = {
          filetypes = { "html", "templ" },
        },
        tailwindcss = {
          filetypes = { "templ", "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "css" },
          init_options = {
            userLanguages = {
              templ = "html",
            },
          },
        },
      },
    },
  },
}
