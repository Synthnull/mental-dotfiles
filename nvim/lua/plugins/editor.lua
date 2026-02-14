return 
{

   --tree-sitter
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      opts = {
         auto_install = true,
         highlight = { enable = true },
         indent = {
            enable = true,
            disable = {}, 
         },
      },  
   },

   {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         require("nvim-tree").setup({
            renderer = {
               root_folder_label = false,
               highlight_opened_files = "all",
               indent_markers = {
                  enable = true, -- Shows the vertical lines connecting folders
               },
            },
            view = {
               width = 30,
               side = "left",
            },
            filters = {
               dotfiles = false, -- Show hidden files (like .bashrc)
            },
         })
         -- Setting a keybind to toggle the tree
         -- Ensure your leader key is set in init.lua (usually vim.g.mapleader = " ")
         vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true })
      end,
   },

}
