return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      vim.keymap.set('n', '<leader>do', ':DiffviewOpen<CR>', {}),
      vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', {}),
    })
  end,
}
