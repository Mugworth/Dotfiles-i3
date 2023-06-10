return {
	-- set to HEAD for now. I'm sill making too many changes for this repo related to lazy itself
	{ "folke/lazy.nvim", version = false },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local myWKConfig = require("user.config.which-key-config")
			local wk = require("which-key")
			require("which-key").setup({
				myWKConfig.settings,
			})
			local opts = myWKConfig.normalOpts
			local vopts = myWKConfig.visualOpts

			local mappings = myWKConfig.mappings
			local vmappings = myWKConfig.vmappings

			wk.register(mappings, opts)
			wk.register(vmappings, vopts)
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },
	-- changes gui input
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		lazy = false,
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				version = false,
				config = function()
					local lsp = require("lsp-zero")
					lsp.preset("recommended")

					lsp.set_preferences({
						suggest_lsp_servers = true,
						setup_servers_on_start = true,
						configure_diagnostics = true,
						cmp_capabilities = true,
						manage_nvim_cmp = true,
						call_ = "local",
						sign_icons = {
							error = "✘",
							warn = "▲",
							hint = "",
							info = "",
						},
						set_lsp_keymaps = { omit = { "<C-k>", "gl" } },
					})

					lsp.nvim_workspace()
					require("lspconfig")["bashls"].setup({
						filetypes = { "sh", "zsh", "bash" },
					})
					-- require("lspconfig").lua_ls.setup({
					-- 	on_attach = on_attach,
					-- 	capabilities = capabilities,
					-- 	settings = {
					-- 		Lua = {
					-- 			diagnostics = {
					-- 				globals = { "vim" },
					-- 			},
					-- 			workspace = {
					-- 				library = {
					-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
					-- 				},
					-- 			},
					-- 		},
					-- 	},
					-- })
					lsp.setup()
				end,
			},
			-- LSP Support
			{
				"williamboman/mason.nvim",
				cmd = "Mason",
				keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
				opts = {
					ensure_installed = {
						"stylua",
						"shellcheck",
						"shfmt",
						"flake8",
						"lua_ls",
					},
				},
			},
			{
				"notjl/mason-lspconfig.nvim",
				-- config = function()
				--   require("mason-lspconfig").setup({
				--     ensure_installed = {
				--       'lua_ls',
				--     },
				--   })
				-- end
			},
			--
			-- AUTOCOMPLETION
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",

			-- SNIPPETS
			-- "dcampos/nvim-snippy",
			-- "dcampos/cmp-snippy",
			-- "L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
	},
  -- TODO: clean up
  --TODO
	-- {
	-- 	"folke/todo-comments.nvim",
	--    lazy = false,
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	--    opts = {}
	-- },
	{
		"L3MON4D3/LuaSnip",
		lazy = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
	{
		"jbyuki/venn.nvim",
		lazy = false,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		config = function()
			require("user.config.completion")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("user.config.treesitterconfig")
		end,
	},
	{
		"jbyuki/nabla.nvim",
		keys = {
			{ "<leader>M", "<cmd>lua require('nabla').popup()<CR>", desc = "toggle latex math" },
		},
	},
	{
		"HiPhish/nvim-ts-rainbow2",
		lazy = false,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		lazy = false,
		config = function()
			require("user.config.miniconfig")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				require("user.config.lineconfig"),
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		-- cmd or very lazy not working properly
		-- lazy = false,
		tag = "nightly",
		config = function()
			require("user.config.ntreeconfig")
		end,
		event = "VeryLazy",
	},
	{
		"akinsho/bufferline.nvim",
		version = "v3.1",
		event = "VeryLazy",
		config = function()
			require("user.config.bufferlineconfig")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.1",
		config = function()
			require("user.config.telescope")
		end,
	},
	{ "nvim-telescope/telescope-media-files.nvim" },
	{
		"roobert/search-replace.nvim",
		event = "VeryLazy",
		config = function()
			require("search-replace").setup({
				-- optionally override defaults
				default_replace_single_buffer_options = "gcI",
				default_replace_multi_buffer_options = "egcI",
			})
		end,
	},
	--colors hexagonal variables
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		event = "VeryLazy",
	},
	{
		-- one of fav, makes code readable
		"mhartington/formatter.nvim",
		cmd = "Format",
		config = function()
			require("user.config.formattier")
		end,
	},
	{
		"goolord/alpha-nvim",
		init = function()
			require("user.config.alpha")
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "jj", "kk", "kj" }, -- a table with mappings to use
				timeout = 300, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
				-- example(recommended)
				-- keys = function()
				--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
				-- end,
			})
		end,
	},
	{
		"folke/twilight.nvim",
		cmd = "Twilight",
		config = function()
			require("twilight").setup({
				{
					dimming = {
						alpha = 0.25, -- amount of dimming
						-- we try to get the foreground from the highlight groups or fallback color
						color = { "Normal", "#bbc2cf" },
						term_bg = "#2a2e38", -- if guibg=NONE, this will be used to calculate text color
						inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
					},
					context = 10, -- amount of lines we will try to show around the current line
					treesitter = true, -- use treesitter when available for the filetype
					-- treesitter is used to automatically expand the visible text,
					-- but you can further control the types of nodes that should always be fully expanded
					expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
						"function",
						"method",
						"table",
						"if_statement",
					},
					exclude = {}, -- exclude these filetypes
				},
			})
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = function()
			require("zen-mode").setup()
		end,
	},
	{ "rainbowhxch/beacon.nvim", lazy = false, version = false },
	{
		-- 	"cbochs/grapple.nvim", -- Optional: provides the "grapple" query item
		"ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
	},
	{
		"jakewvincent/mkdnflow.nvim",
		-- rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
		config = function()
			require("mkdnflow").setup({
				mappings = {
					MkdnUpdateNumbering = { "n", "<leader>nu" },
				},
			})
		end,
		ft = { "markdown" },
	},
	{
		"mickael-menu/zk-nvim",
		config = function()
			require("zk").setup({
				-- can be "telescope", "fzf" or "select" (`vim.ui.select`)
				-- it's recommended to use "telescope" or "fzf"
				picker = "telescope",

				lsp = {
					config = {
						cmd = { "zk", "lsp" },
						name = "zk",
						-- on_attach = ...
					},

					-- automatically attach buffers in a zk notebook that match the given filetypes
					auto_attach = {
						enabled = true,
						filetypes = { "markdown" },
					},
				},
			})
		end,
		lazy = false,
	},
	{
		"ellisonleao/glow.nvim",
		ft = "markdown",
	},
	{
		"mzlogin/vim-markdown-toc",
		ft = "markdown",
	},
	{
		"ekickx/clipboard-image.nvim",
		cmd = "PasteImg",
	},
	{
		"chrishrb/gx.nvim",
		event = { "BufEnter" },
		config = true, -- default settings
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"knubie/vim-kitty-navigator",
		lazy = false,
	},
	{
		"fladson/vim-kitty",
		lazy = false,
	},
}
