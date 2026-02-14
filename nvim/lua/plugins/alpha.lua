return {
   'goolord/alpha-nvim',
   dependencies = { 'nvim-tree/nvim-web-devicons' },
   config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set a cool header (Example: "Neovim")
      dashboard.section.header.val = {
         [[                               __                ]],
         [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
         [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
         [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
         [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
         [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }

      -- Apply Catppuccin Colors (Blue for header, Green for buttons)
      dashboard.section.header.opts.hl = 'AlphaHeader'
      dashboard.section.buttons.opts.hl = 'AlphaButton'

      -- Define highlight groups manually if your theme doesn't do it automatically
      vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#89b4fa' }) -- Catppuccin Blue
      vim.api.nvim_set_hl(0, 'AlphaButton', { fg = '#a6e3a1' }) -- Catppuccin Green

      alpha.setup(dashboard.opts)
   end,
}
