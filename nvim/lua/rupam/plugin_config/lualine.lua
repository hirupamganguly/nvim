require('lualine').setup {
options = {
 icons_enabled = true,
 theme = 'nord',
 },
 section = {
 lualine_a = {
  {
  'filename',
  path=1,
  }
  }
  }
}
