local status_ok, illuminate = pcall(require, "illuminate")
if status_ok then
  illuminate.configure {
   filetypes_denylist = {
        'dirvish',
        'fugitive',
        'toggleterm',
    },
  }
end
