vim.g.mapleader = " "

require("config.lazy")

vim.opt.expandtab = true   -- Converts tabs to spaces
vim.opt.tabstop = 3        -- Visual width of a tab
vim.opt.softtabstop = 3    -- Width of a tab when editing
vim.opt.shiftwidth = 3     -- Width of auto-indent
vim.opt.laststatus = 3 -- One statusline at the bottom instead of one per window

vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", ctermbg = "none" })

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

vim.wo.number = true

vim.diagnostic.config({
  update_in_insert = true, -- Updates errors while you type
  severity_sort = true,
})

-- Change how often the LSP updates (default is 4000ms)
vim.opt.updatetime = 250
