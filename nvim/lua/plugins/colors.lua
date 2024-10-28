return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      local conf = require("catppuccin")
      conf.setup({
        transparent_background = true,
      })
      vim.cmd.colorscheme "catppuccin"
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
          light = "lotus",
        }
      })
    end
  },
  {
    "tomasiser/vim-code-dark",
    lazy = false,
    name = "code-dark",
    priority = 1002,
    config = function()
    end
  }
}
