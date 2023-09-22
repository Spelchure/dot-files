
THEME = "tokyonight"
--THEME = "gruvbox-baby" -- uncomment for gruvbox 


if THEME == "gruvbox-material" then
  -- setup
  vim.g.gruvbox_material_better_performance = 1
  vim.g.gruvbox_material_background = 'hard'
  vim.g.gruvbox_material_dim_inactive_windows = 0
  vim.g.gruvbox_material_diagnostic_text_highlight = 0
  vim.g.gruvbox_material_current_word = 'grey background'
elseif THEME == "tokyonight" then
  require"tokyonight".setup {
    style = "tokyo", -- moon, night
    dim_inactive = true,

  }
end


vim.cmd("colorscheme " .. THEME)

