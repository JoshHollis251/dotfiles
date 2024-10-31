vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>bp", ":RunScp<CR>", {})
vim.lsp.inlay_hint.enable(true)

vim.cmd("set number")
vim.cmd("set relativenumber")
