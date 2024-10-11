return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
    end
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
    priority = 1001,
    config = function()
      local conf = require("kanagawa")
      conf.setup({
        background = {
          dark = "dragon",
          light = "lotus",
        }
      })
      vim.cmd.colorscheme "kanagawa"
    end
  }
}
