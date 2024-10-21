return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      --Custom commands
      --telescope a specific directory
      vim.api.nvim_create_user_command('TelescopeDir', function()
        local input_dir = vim.fn.input('Enter directory: ')
        builtin.find_files({
          search_dirs = { input_dir },
          hidden = true, -- Include hidden files
        })
      end, {})

      --telescope live grep in a specific directory
      vim.api.nvim_create_user_command('TelescopeGrepDir', function()
        local input_dir = vim.fn.input('Enter directory: ')
        builtin.live_grep({
          search_dirs = { input_dir },
          hidden = true, -- Include hidden files
        })
      end, {})

      --End custom commands

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "prev grep session" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "find buffers" })
      vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = "man pages" })
      vim.keymap.set('n', '<leader>fs', builtin.search_history, { desc = "search history" })
      vim.keymap.set('n', '<leader>fF', ':TelescopeDir<CR>',
        { noremap = true, silent = true, desc = "Find Files in Directory" })
      vim.keymap.set('n', '<leader>fG', ':TelescopeGrepDir<CR>',
        { noremap = true, silent = true, desc = "live grep in directory" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
