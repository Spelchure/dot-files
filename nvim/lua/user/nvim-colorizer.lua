local status_ok, nvim_colorizer = pcall(require, "colorizer")
if status_ok then
  nvim_colorizer.setup()
end

