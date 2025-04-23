return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "jose-elias-alvarez/null-ls.nvim", optional = true }, -- Optional
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup()

      mason_lspconfig.setup({
        ensure_installed = {
          "html",
          "cssls",
          "tailwindcss",
          "ts_ls",
          "lua_ls",
        },
        automatic_installation = true,
      })

      -- Keybindings
      vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
      vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Show references' })
      vim.keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = 'Go to type definition' })
      vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename' })
      vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code actions' })
      vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', { desc = 'Format code' })
      vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { desc = 'Document symbols' })
      vim.keymap.set('n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { desc = 'Workspace symbols' })
      vim.keymap.set('n', '<leader>ho', '<cmd>lua vim.lsp.diagnostic.open_float()<CR>', { desc = 'Show diagnostics' })
      vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Go to previous diagnostic' })
      vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Go to next diagnostic' })

      -- LSP Server configurations
      lspconfig.lua_ls.setup({
        root_dir = function(filename)
          return vim.fs.dirname(vim.fs.find({ ".git", "init.lua", "package.json" }, { upward = true })[1]) or vim.fn.getcwd()
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })

      lspconfig.html.setup {}
      lspconfig.cssls.setup {}
      lspconfig.tailwindcss.setup {}
      lspconfig.ts_ls.setup {}
    end,
  },
}
