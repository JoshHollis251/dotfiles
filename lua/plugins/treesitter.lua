return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local conf = require("nvim-treesitter.configs")
    conf.setup({
      ensure_installed = {"lua", "c", "cpp"},
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
