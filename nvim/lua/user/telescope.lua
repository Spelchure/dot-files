local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

-- remove preview in find files
require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{
  previewer = false
})

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules", "__pycache__", ".svn", ".hg", ".tox" },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Esc>"] = actions.close, -- close with single esc no command mode
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  }
}
