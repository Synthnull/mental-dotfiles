return {
   {
      'hrsh7th/cmp-nvim-lsp',
   },
   {
      'L3MON4D3/LuaSnip',
      dependencies = {
         'saadparwaiz1/cmp_luasnip',
         'rafamadriz/friendly-snippets',
      },
   },

   {
      'hrsh7th/nvim-cmp',
      config = function()
         local cmp = require('cmp')

         require('luasnip.loaders.from_vscode').lazy_load()

         cmp.setup({
            snippet = {
               -- REQUIRED - you must specify a snippet engine
               expand = function(args)
                  -- vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
                  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                  -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                  -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                  -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

                  -- For `mini.snippets` users:
                  -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                  -- insert({ body = args.body }) -- Insert at cursor
                  -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                  -- require("cmp.config").set_onetime({ sources = {} })
               end,
            },
            window = {
               completion = cmp.config.window.bordered({
                  border = 'rounded', -- or 'single', 'double', 'solid'
                  winhighlight = 'Normal:NormalFloat,CursorLine:Visual,Search:None',
                  col_offset = 0,
                  side_padding = 1,
                  scrollbar = false,
               }),
               documentation = cmp.config.window.bordered({
                  border = 'rounded',
               }),
            },

            formatting = {
               fields = { 'abbr', 'kind' },
               format = function(entry, vim_item)
                  -- 1. Remove any leading/trailing whitespace from the suggestion
                  vim_item.abbr = vim_item.abbr:match('^%s*(.-)%s*$')

                  -- 2. Add a little gap ONLY between the word and the label
                  -- This ensures "Snippet" stays on the right but doesn't drift
                  vim_item.abbr = vim_item.abbr .. '  '

                  return vim_item
               end,
            },

            mapping = cmp.mapping.preset.insert({
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               ['<C-Space>'] = cmp.mapping.complete(),
               ['<C-e>'] = cmp.mapping.abort(),
               ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
               { name = 'luasnip' }, -- For luasnip users.
               { name = 'nvim_lsp' },
            }, {
               { name = 'buffer' },
            }),
         })
      end,
   },
}
