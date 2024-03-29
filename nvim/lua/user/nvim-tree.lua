local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local function on_attach(bufnr)
  local api = require("nvim-tree.api");

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.del('n', '<C-t>', { buffer = bufnr })
  --vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  -- Remove filtering:
  vim.keymap.del('n', 'f', {buffer = bufnr});
  -- vim.keymap.set('n', '<C-f>', { buffer = bufnr });
end

nvim_tree.setup {
  on_attach = on_attach,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  modified = {
    enable = true
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
  },
}
