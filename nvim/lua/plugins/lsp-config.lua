return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- Boilerplate keybindings for nvim-lspconfig
      local on_attach = function(client, bufnr)
        -- Helper function to set buffer-specific keymaps
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        -- Keymap options
        local opts = { noremap = true, silent = true }

        -- Keybindings for LSP
        buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)        -- Go to definition
        buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)       -- Go to declaration
        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)    -- Go to implementation
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)        -- List references
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)              -- Show hover information
        buf_set_keymap("n", "<leader>ch", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- Show signature help
        buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)    -- Rename symbol
        buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Show code actions
        buf_set_keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts) -- Format document
        buf_set_keymap("n", "<leader>ds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts) -- List document symbols
        buf_set_keymap("n", "<leader>ws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts) -- List workspace symbols
        buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- Show diagnostics
        buf_set_keymap("n", "<leader>sd", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)       -- Go to previous diagnostic
        buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)       -- Go to next diagnostic
        buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) -- Set location list with diagnostics

        -- Optional: Show function signature when you are typing
        if client.server_capabilities.signatureHelpProvider then
          buf_set_keymap("n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        end
      end

      -- Setup LSP servers with the on_attach function
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--query-driver=/grmn/prj/mrn/**/*",
          "--background-index",
          "--suggest-missing-includes"
        }, -- Start clangd with additional flags
        filetypes = { "c", "cpp", "objc", "objcpp" }, -- File types to support
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  }
}
