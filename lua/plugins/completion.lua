return {
  {
    "github/copilot.vim",
    config = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'solarized',
        -- group = ...,
        callback = function()
          vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
            fg = '#555555',
            ctermfg = 8,
            force = true
          })
        end
      })
    end
  },
  --add an extension for C and C++ autocomplete
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require"lsp_signature".setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "single"
        }
      })
    end
  },
 }
