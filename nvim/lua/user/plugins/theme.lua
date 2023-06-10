return {

 	-- onedark
 	{
 		"navarasu/onedark.nvim",
 		lazy = false,
 		priority = 1000,
    config = function()
 			require("onedark").setup({
 				style = "darker",
 				-- custom_highlights = {
 				-- 	--NvimTreeWinSeparator = { link = "WinSeparator" }
 				-- },
 			})
 			-- Nvim tree hightlithing --
 	 		vim.cmd([[
          colorscheme onedark
          hi BufferLinefill guibg=#1f2329
          hi NvimTreeCursorLine guibg=#1f2329
          hi NvimTreeEndOfBuffer guibg=#2a2c34 guifg=#2a2c34
          hi NvimTreeNormal guibg=#2a2c34
          hi NvimTreeWinSeparator guifg=#bbc2cf
          hi NvimTreeWindowPicker guibg=None
          hi VertSplit guifg=#bbc2cf
          hi CursorLineNr guifg=#ecbe7b
          hi MiniHIpatternsFixme guibg=#1f2329 guifg=#ff6c6b
        ]])
 			vim.api.nvim_exec(
 				[[
       augroup YankHighlight
         autocmd!
         autocmd TextYankPost * silent! lua vim.highlight.on_yank()
       augroup end
       ]],
 				false
 	 		)
 	 	end,
 	},
}
