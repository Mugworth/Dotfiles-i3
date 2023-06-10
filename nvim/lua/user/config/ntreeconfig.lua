require('nvim-tree').setup ({
    auto_reload_on_write = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = false,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    sort_by = "",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    on_attach = "disable",
    remove_keymaps = false,
    select_prompts = false,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    view = {
      adaptive_size = false,
      centralize_selection = false,
      cursorline = true,
      width = 30,
      hide_root_folder = false,
      side = "left",
      preserve_window_proportions = true,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
        custom_only = false,
          list = {
          { key = "h", action = "dir_up" },
          { key = "l", action = "dir_down"},
          { key = "L", action = ""},
        },
      },
    },
    renderer = {
      add_trailing = false,
      group_empty = true,
      highlight_git = true,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_label = ":t",
      indent_width = 0,
      icons = {
 --       webdev_colors = lvim.use_icons,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
--        show = {
--          file = lvim.use_icons,
--          folder = lvim.use_icons,
--          folder_arrow = lvim.use_icons,
--          git = lvim.use_icons,
 --       },
--        glyphs = {
--          default = lvim.icons.ui.Text,
--          symlink = lvim.icons.ui.FileSymlink,
--          bookmark = lvim.icons.ui.BookMark,
--          folder = {
--            arrow_closed = lvim.icons.ui.TriangleShortArrowRight,
--            arrow_open = lvim.icons.ui.TriangleShortArrowDown,
--            default = lvim.icons.ui.Folder,
--            open = lvim.icons.ui.FolderOpen,
--            empty = lvim.icons.ui.EmptyFolder,
--            empty_open = lvim.icons.ui.EmptyFolderOpen,
--            symlink = lvim.icons.ui.FolderSymlink,
--            symlink_open = lvim.icons.ui.FolderOpen,
--          },
--          git = {
--            unstaged = lvim.icons.git.FileUnstaged,
--            staged = lvim.icons.git.FileStaged,
--            unmerged = lvim.icons.git.FileUnmerged,
--            red = lvim.icons.git.FileRed,
--            untracked = lvim.icons.git.FileUntracked,
--            deleted = lvim.icons.git.FileDeleted,
--            ignored = lvim.icons.git.FileIgnored,
--          },
--        },
      },
    },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 200,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
})
--require("nvim-tree").setup({
--  sort_by = "case_sensitive",
--  view = {
--    adaptive_size = false,
--    side = "left",
--    width = 25,
--    hide_root_folder = true,
--    mappings = {
--      list = {
--        { key = "h", action = "dir_up" },
--        { key = "l", action = "dir_down"}
--      },
--    },
--  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = true,
--  },
--  actions = {
--    open_file = {
--      resize_window = true,
--    },
--  },
--  disable_netrw = true,
--  hijack_netrw = true,
--  open_on_setup = false,
--  ignore_ft_on_setup = { "alpha" },
--  hijack_cursor = true,
--  hijack_und_buffer_xdddd_opening = false,
--  update_cwd = true,
--  update_focused_file = {
--    enable = true,
--    update_cwd = true,
--  },
-- })


