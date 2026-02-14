return {
   {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
         library = {
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
         },
      },
   },

   {
      'williamboman/mason.nvim',
      config = function()
         require('mason').setup()
      end,
   },

   {
      'williamboman/mason-lspconfig.nvim',
      config = function()
         require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'ts_ls', 'eslint', 'basedpyright', 'ruff', 'phpactor'},
         })
      end,
   },
   {
      'neovim/nvim-lspconfig',
      config = function()
         local capabilities = require('cmp_nvim_lsp').default_capabilities()

         vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            settings = {
               Lua = {
                  diagnostics = { globals = { 'vim' } },
                  telemetry = { enable = false },
               },
            },
         })

         local servers = { 'ts_ls', 'eslint', 'zls' }
         for _, lsp in ipairs(servers) do
            vim.lsp.config(lsp, { capabilities = capabilities })
         end

         vim.lsp.enable({ 'lua_ls', 'ts_ls', 'zls', 'eslint', 'basedpyright', 'ruff', 'phpactor'})
         vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
         vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)
      end,
   },

   {
      'stevearc/dressing.nvim',
      opts = {}, -- Default settings are perfect for a dropdown
   },
}
