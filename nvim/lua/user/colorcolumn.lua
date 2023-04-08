local status_ok, virtcolumn = pcall(require, "virtcolumn")
if not status_ok then
  return
end

virtcolumn.setup {}

