# nvim
/home/rupam/.local/share/nvim/site/pack/packer/start/onedark.nvim/lua/onedark/init.lua
49 no line transparent = true,     -- don't set background

##  Youtube Video Link of this Setup

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/xdskv1R-x7w/0.jpg)](https://www.youtube.com/watch?v=xdskv1R-x7w)


## init.lua
``` lua
-- Init file contains dependencies
require('plugins')
require('keybinds')
require('setting')
require('plugin_configs.onedark-config')
require('plugin_configs.nvim-tree-config')
require('plugin_configs.lualine-config')
require('plugin_configs.treesitter-config')
require('plugin_configs.telescope-config')
require('plugin_configs.bufferline-config')
require('plugin_configs.mason-config')
require('plugin_configs.gopls-config')
require('plugin_configs.dap-config')
require('plugin_configs.code-completion-config')
require('plugin_configs.auto-bracket-pair')
require('plugin_configs.auto-indent-config')
```


## plugins.lua

``` lua
local ensure_packer = function()
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
   fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
   vim.cmd [[packadd packer.nvim]]
   return true
end
return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'
-- My plugins here
use 'navarasu/onedark.nvim' -- ONE DARK theme for NEOVIM
use {
'nvim-tree/nvim-tree.lua', -- File explorer for Neo Vim
requires = {'nvim-tree/nvim-web-devicons'},  -- Icons for Neo Vim
}
use 'nvim-lualine/lualine.nvim' -- Status Line for Neo Vim
use 'nvim-treesitter/nvim-treesitter' -- Formatting programming Languages
use {
'nvim-telescope/telescope.nvim', tag = '0.1.0', -- Search Capability for Neo Vim
-- or                            , branch = '0.1.x',
requires = { {'nvim-lua/plenary.nvim'} }
}
use {'akinsho/bufferline.nvim', tag = "v3.*"} -- Tab for Opened Files 
use { -- Go lang support for NeoVim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} } -- Debug UI

-- AUTO COMPLETION
-- Hrsh7th Code Completion Suite
use 'hrsh7th/nvim-cmp' 
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-nvim-lua'
use 'hrsh7th/cmp-nvim-lsp-signature-help'
use 'hrsh7th/cmp-vsnip'                             
use 'hrsh7th/cmp-path'                              
use 'hrsh7th/cmp-buffer'                            
use 'hrsh7th/vim-vsnip'

-- This plugin adds indentation guides to all lines
use "lukas-reineke/indent-blankline.nvim"

-- A super powerful autopair plugin
use "windwp/nvim-autopairs"

-- Git Fugitive
use 'tpope/vim-fugitive'
 
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
require('packer').sync()
end
end)
```

## keybinds.lua

``` lua
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end
-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim tab
map('n', '<C-Q>', '<CMD>q<CR>')

-- Move to the next/previous buffer
map('n', '<C-[>', '<CMD>bp<CR>')
map('n', '<C-]>', '<CMD>bn<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-h>', '<CMD>vsplit<CR>')
map('n', '<C-v>', '<CMD>split<CR>')

-- Move the cursor 50 lines UP/DOWS
map('n', '<C-Up>', '50k')
map('n', '<C-Down>', '50j')

-- Toggle NvimTree
map('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Telescope Key Binding which already present in config 
--vim.keymap.set('n', '<c-p>', builtin.find_files, {})
--vim.keymap.set('n', '<space><space>', builtin.oldfiles, {})
--vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<space>fh', builtin.help_tags, {})


--DAP Key Binding which already present in config 
--vim.keymap.set('n', '<space>d', [[:NvimTreeToggle<CR> :lua require('dap').continue()<CR>]], {}) -- SPACE-d for Start DEBUG
--vim.keymap.set('n', '<space>c', [[:NvimTreeToggle<CR> :lua require('dap').close()<CR>]], {}) -- SPACE-c for STOP DEBUG
--vim.keymap.set('n', '<space>r', [[:NvimTreeToggle<CR> :lua require('dap').repl.close()<CR>]], {}) -- SPACE-r for STOP Repl
--vim.keymap.set('n', '<s-b>', [[:lua require('dap').toggle_breakpoint()<CR>]], {}) -- SHIFT-b for Toggle Breakpoint


--CTRL+s to save file instead of :w
map('n', '<C-s>', ':w<CR>')
--CTRL+z to undo
map('n','<C-z>', 'u')
--CTRL+x to redo
map('n','<C-x>','<C-r>')

```
