return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      file_panel = {
        position = "left",
        width = 35,
        height = 10,
      },
      vim.keymap.set('n', '<leader>dp', ':DiffviewOpen<CR>', {}),

    })
  end,
}
