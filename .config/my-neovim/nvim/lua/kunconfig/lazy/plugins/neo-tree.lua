return
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
	
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>e", "<Cmd>Neotree toggle float left <CR>")
	end
}
