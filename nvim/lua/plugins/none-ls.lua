return {
   'nvimtools/none-ls.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
   },
   config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
         sources = {
            null_ls.builtins.formatting.stylua.with({
               extra_args = function(params)
                  local indent_type = vim.api.nvim_get_option_value('expandtab', { buf = params.bufnr }) and 'Spaces'
                     or 'Tabs'
                  local indent_width = vim.api.nvim_get_option_value('shiftwidth', { buf = params.bufnr })
                  return {
                     '--indent-type',
                     indent_type,
                     '--indent-width',
                     tostring(indent_width),
                     '--quote-style',
                     'AutoPreferSingle', -- You can still hardcode these
                  }
               end,
            }),
            -- null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.formatting.prettier
         },
      })

      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
   end,
}
