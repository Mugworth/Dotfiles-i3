local M = {}

M.settings = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
    spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜ ", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "top", -- bottom, top
    margin = { 4, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 12, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 7, max = 25 }, -- min and max height of the columns
    width = { min = 15, max = 40 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "right",
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line xdddd the popup is visible
}

M.normalOpts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. ssd a buffer number for buffer local mappings
  silent = true, -- use `silent` xdddd creating keymaps
  noremap = true, -- use `noremap` xdddd creating keymaps
  nowait = true, -- use `nowait` xdddd creating keymaps
}

M.visualOpts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. ssd a buffer number for buffer local mappings
  silent = true, -- use `silent` xdddd creating keymaps
  noremap = true, -- use `noremap` xdddd creating keymaps
  nowait = true, -- use `nowait` xdddd creating keymaps
}

M.vmappings = {
  r = { "<cmd>SearchReplaceSingleBufferVisualSelection<CR>", "Search and replace inside an visual selection" },
  z = {
    f = { ":'<,'>ZkMatch<CR>", "Search for note with visual selection"},
  }
}

M.mappings = {
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  -- ["m"] = { "<cmd>MindOpenMain<CR>", "Open Main Tree" },
  ["e"] = { "<cmd>NvimTreeFindFileToggle<CR>", "Explorer" },
  ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
  [" "] = { "<cmd>lua require'hop'.hint_words()<cr>", "Find word (HOP)" },
  ["a"] = { "<cmd>lua require'harpoon.mark'.add_file()<cr>", "Add file to harpoon" },
  ["1"] = { "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", "File 1" },
  ["2"] = { "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", "File 2" },
  ["3"] = { "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", "File 3" },
  ["4"] = { "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", "File 4" },
  ["w"] = { "<cmd>update<cr>", "Save File" },
  ["g"] = { "<cmd>Telescope live_grep<CR>", "Grep files" },
  r = {
    name = "Format & Replace & Regex ",
    f = { "<cmd>Format<CR>", "Format File" },
    r = { "<cmd>SearchReplaceSingleBufferOpen<CR>", "Search and Replace"},
    z = { "<cmd>SearchReplaceMultiBufferOpen<CR>", "Search and Replace in opened buffers"},
    s = { "<cmd>SearchReplaceSingleBufferSelections<CR>", "Search and Replace with GUI"},
    t = { "<cmd>TroubleToggle<CR>", "Toggle lsp info" },
  },
  -- b = {
  --    = "Buffers",
  --   j = { "<cmd>BufferLinePick<CR>", "jump to buffer" },
  --   f = { "<cmd>Telescope buffers<CR>", "Find buffer" },
  --   w = { "<cmd>%bd|e#|bd#<CR>", "wipeout buffer" },
  --   r = {
  --     "<cmd>BufferLineCloseRight<cr>",
  --     "close all BufferLines to the right",
  --   },
  --   l = {
  --     "<cmd>BufferLineCloseLeft<cr>",
  --     "close all BufferLines to the left",
  --   },
  --   d = {
  --     "<cmd>BufferLineSortByDirectory<cr>",
  --     "sort BufferLines automatically by directory",
  --   },
  --   n = {
  --     "<cmd>BufferLineSortByExtension<cr>",
  --     "sort BufferLines automatically by language",
  --   },
  --   t = {
  --     "<cmd>BufferLineSortByTabs<cr>",
  --     "sort BufferLines automatically by Tabs",
  --   },
  -- },
  --   t = {
  --  name = "Trouble",
  --     o = { "<cmd>TroubleToggle<cr>", "Toggle lsp info" },
  --  x = { "<cmd>Lazy clean<cr>", "clean unused package" },
  --  h = { "<cmd>Lazy help<cr>", "lazy plugin help" },
  --  },

    s = {
    name = "Search",
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  n = {
    name = "Notes and Markdown",
    S = { "<cmd>set spell!<CR>", "Toggle spell checker" },
    m = { "<cmd>ZkCd<cr>", "Cd into notebook root"},
    c = { "<cmd>lua require('zk').new({group = 'weekly', edit = true, dir = 'weekly'})<cr>", "Cd into notebook root"},
    s = { "<cmd>ZkNotes<cr>", "Opens Note Picker"},
    t = { "<Cmd>ZkTags<CR>", "Search for Note by Tag"},
    z = { "<cmd>ZenMode<cr>", "Toogle Zen Mode"},
    o = { "<cmd>GenTocGFM<cr>", "Generate table of contents"},
    M = { "<cmd>MarkdownPreviewToggle<cr>", "Preview an Markdown file"},
    -- p = { "<cmd>PasteImg<cr>", "Paste an Image"},
    n = {
    "<Cmd>lua require('zk.commands').get('ZkNew')({title = vim.fn.input('Title: ')})<CR>",
    "New Note"
    },
    f = {
      "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
      "Search for Note with given query",
    },
  },
}

return M
