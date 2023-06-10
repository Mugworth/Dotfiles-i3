local x, n, i, v, c = "x", "n", "i", "v", "c"
-- local n_i = { n, i }
local i_c = { i, c }
-- local ex_t = { n, i, v }
local n_v = { n, v }
local n_x = { n, x }

local keymap = vim.keymap.set
local default_settings = { noremap = true, silent = true }
-- local allow_remap = { noremap = false, silent = true }

vim.cmd([[
  nnoremap <cr> :noh<cr><cr>
  autocmd VimResized * wincmd =
  "nnoremap <return> :%<return>
  set autoread

  augroup autoRead
    autocmd!
    autocmd CursorHold * silent! checktime
  augroup END
  autocmd BufWritePost *note-*.md silent ! /home/kuba/config/shell/buildnote %:p
]])

-- Move to window using the <meta> movement keys
keymap("n", "<cr>", "<cmd>noh<cr><cr>")
-- keymap("n", "j", "v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'", { expr = true })
-- keymap("n", "k", "v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'", { expr = true })
-- keymap("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
-- keymap("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
-- Move in insert mode
keymap(n_v, '<C-f>', '<Cmd>Telescope current_buffer_fuzzy_find previewer=false<CR>', default_settings)
keymap(n_v, "<C-e>", "<Cmd>Telescope find_files<CR>", default_settings)
keymap(n, 'gb', '<Cmd>BufferLinePick<CR>', default_settings)
keymap(i, '<Esc>', '<Esc>`^', default_settings)
-- not soo useful better stay in normal mode
keymap(i, ",", ",<c-g>u")
keymap(i, ".", ".<c-g>u")
keymap(i, ";", ";<c-g>u")
keymap(i_c, "<A-h>", "<Left>")
keymap(i_c, "<A-j>", "<Down>")
keymap(i_c, "<A-k>", "<Up>")
keymap(i_c, "<A-l>", "<Right>")
-- remove search buffer
keymap(n, "<cr>", "<cmd>noh<cr><cr>")
-- move around text ~~~
keymap(n, "J", "%")
keymap(v, "J", "}")
keymap(v, "K", "{")

-- keymap(n, "<C-i>", "<C-i>", default_settings)

keymap(n, "<A-q>", "<cmd>silent bp<Bar>bd #<cr>")
keymap(i, "<A-w>", "<Esc>viwUea")

keymap(n, "<A-k>", "<cmd>bprevious<cr>")
keymap(n, "<A-j>", "<cmd>bnext<cr>")
keymap(n, "<S-A-k>", "<cmd>BufferLineMovePrev<cr>")
keymap(n, "<S-A-j>", "<cmd>BufferLineMoveNext<cr>")

keymap(n, "?", "<cmd>lua require'hop'.hint_patterns()<cr>")
keymap(n, "<Tab>", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>")

keymap(n, "c", '"_c')
keymap(n, "C", '"_C')
keymap(n, "cc", '"_cc')
keymap(x, "c", '"_c')
keymap(n, "/", [[/\v]])
keymap(n_x, ";", ":")

--vim.keymap.del('n', 'gw')

function escape_status()
	local ok, m = pcall(require, "better_escape")
	return ok and m.waiting and "✺" or ""
end
