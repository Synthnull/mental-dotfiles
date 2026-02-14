return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				integrations = {
					alpha = true,
					cmp = true,
					nvimtree = true,
				},
				custom_highlights = function(colors)
					return {
						FloatBorder = { fg = colors.mauve, bg = "NONE" },
						NormalFloat = { bg = "NONE" },

						SignColumn = { bg = "NONE" },
						StatusLine = { bg = "NONE" },
						StatusLineNC = { bg = "NONE" },

						CmpDocBorder = { fg = colors.mauve, bg = "NONE" },
						CmpMenuBorder = { fg = colors.mauve, bg = "NONE" },

						NvimTreeFolderIcon = { fg = colors.mauve },
						NvimTreeFolderName = { fg = colors.mauve },
						NvimTreeIndentMarker = { fg = colors.surface1 },

						CmpItemKindSnippet = { fg = colors.mauve },
						CmpItemKindFunction = { fg = colors.mauve },
						CmpItemAbbrMatch = { fg = colors.mauve, style = { "bold" } },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
