return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",

      },
    }
  },
  {
    "yorickpeterse/nvim-window",
    config = function()
      -- Your configuration for nvim-window goes here
      require('nvim-window').setup {
        -- Set your desired options
        chars = { '1', '2', '3', '4', '5', '6', '7'}, -- Example keybindings
        normal_hl = 'Search', -- Highlight for the selected window
        hint_hl = 'Bold', -- Highlight for the window hints
      }
    end,
    keys = {
      -- Add a keybinding to trigger nvim-window
      { "<leader>ww", ":lua require('nvim-window').pick()<CR>", desc = "Pick a window" },
    },
  }
}
