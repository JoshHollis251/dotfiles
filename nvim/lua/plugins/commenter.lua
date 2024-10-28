return {
  "numToStr/Comment.nvim",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "h", "hpp" },
      callback = function()
        vim.api.nvim_command('setlocal commentstring=//%s')
      end,
    })
  end,
}
