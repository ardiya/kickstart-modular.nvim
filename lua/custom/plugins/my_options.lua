-- usually I have nerd font.. so use that
vim.g.have_nerd_font = true

-- relative line numbers
vim.opt.relativenumber = true

-- neovide configs
if vim.g.neovide then
  -- only set font in neovide, otherwise the terminal emulator would handle it
  vim.opt.guifont = 'FantasqueSansM Nerd Font Mono'

  vim.g.neovide_cursor_vfx_mode = 'pixiedust'
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_no_idle = true
  vim.g.neovide_remember_window_size = true

  vim.g.neovide_transparency = 0.95
  vim.g.transparency = 0.95
end

return {}

-- vim: ts=2 sts=2 sw=2 et
