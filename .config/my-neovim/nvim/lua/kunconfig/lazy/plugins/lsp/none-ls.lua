return {
  "nvimtools/none-ls.nvim",

  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
  end
}
