return {
  'rcarriga/nvim-notify',

  config = function()
    vim.notify = require("notify")
    vim.notify("Hello Neovim")
  end
}
