return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "eslint", "basedpyright", "ruff", "phpactor", "clojure_lsp" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						telemetry = { enable = false },
					},
				},
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				-- This tells clangd how to format if no .clang-format file is found
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = true
				end,
				-- For direct formatting control via LSP
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders=true",
					"--query-driver=/usr/sbin/gcc,/usr/sbin/g++",
				},

				initialization_options = {
					fallbackFlags = {
						"-style={BasedOnStyle: Google, IndentWidth: 3, TabWidth: 3, ContinuationIndentWidth: 3}",
					},
				},
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
				root_markers = { ".clangd", ".git", "compile_commands.json", "compile_flags.txt" },
			})

			local servers = { "ts_ls", "eslint", "zls" }
			for _, lsp in ipairs(servers) do
				vim.lsp.config(lsp, { capabilities = capabilities })
			end

			vim.lsp.enable({ "lua_ls", "ts_ls", "zls", "eslint", "basedpyright", "ruff", "phpactor", "clangd", "clojure_lsp" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
		end,
	},

	{
		"stevearc/dressing.nvim",
		opts = {}, -- Default settings are perfect for a dropdown
	},
}
