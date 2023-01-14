-- This Config is use to setup LuaLine as a status bar for NEOVIM

require('lualine').setup {
   options = {
      icons_enabled = true,
      theme = 'nord',
   },
   section = {
      lualine_a = {
         {
            'filename',
            path = 1
         }
      }
   }
}
