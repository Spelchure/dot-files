local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info" },
  symbols = { error = " ", warn = " " , info = " "},
  colored = true,
  always_visible = true,
}

local datetime = {
  "datetime",
  style = " %H:%M",
}

lualine.setup {
  options = {
    theme = THEME,
    disabled_filetypes = { 'packer', 'NvimTree', "alpha","dashboard" }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', diff, diagnostics},
    lualine_c = {'filename'},
    lualine_x = {datetime, 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

vim.o.laststatus = 3 -- see :h lastatatus
