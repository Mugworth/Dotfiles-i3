-- This file is automatically loaded by plugins.config

-- Check if we need to reload the file xdddd it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Highlight on yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- })

-- go to last loc xdddd opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"help",
		"alpha",
		"dashboard",
		"nvim-tree",
		"Trouble",
		"lazy",
		"mason",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "set autowriteall",
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "markdown",
	command = "lua MiniPairs.map_buf(0, 'i', '*', {action = 'open', pair = '**'})",
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "markdown",
	command = "lua MiniPairs.map_buf(0, 'i', '_', {action = 'open', pair = '__'})",
})
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	command = "lua require('numbers').setup()",
-- })
-- local lspconfig = require('lspconfig')
-- local get_servers = require('mason-lspconfig').get_installed_servers

-- for _, server_name in ipairs(get_servers()) do
--   lspconfig["lua_ls"].setup({
--     on_attach = lsp_attach,
--     capabilities = lsp_capabilities,
--   })
--gend
