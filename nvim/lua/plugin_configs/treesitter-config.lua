-- This Config is use to setup Formatting code for NEOVIM
require'nvim-treesitter.configs'.setup {
   -- A list of parser names, or "all" (the four listed parsers should always be installed)
   ensure_installed = { "go" },

   -- Install parsers synchronously (only applied to `ensure_installed`)
   sync_install = false,
   highlight = {
      -- `false` will disable the whole extension
      enable = true,
   }
}
