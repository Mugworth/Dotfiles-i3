-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
    --["<tab>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "s", "c" }),
		["<C-j>"] = cmp.mapping.scroll_docs(-1),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-k>"] = cmp.mapping.scroll_docs(1),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
     ["<Esc>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "snippy"},
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "path" },
		{ name = "buffer" },
	}),
	completion = {
		completeopt = "enu,noselect",
	},

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	}),

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	}),
})
-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["pyright"].setup({
	capabilities = capabilities,
})
require("lspconfig")["rust_analyzer"].setup({
	capabilities = capabilities,
})
require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
})

local lspconfig = require("lspconfig")
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/kuba/omnisharp/OmniSharp.exe"

require("lspconfig").omnisharp.setup({
	cmd = { "mono", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	filetypes = { "cs", "vb" },
	init_options = {},
	on_new_config = function(new_config, new_root_dir)
		if new_root_dir then
			table.insert(new_config.cmd, "-s")
			table.insert(new_config.cmd, new_root_dir)
		end
	end,
	root_dir = lspconfig.util.root_pattern("*.sln"),
})
