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

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
require('packer').sync()
end
end)
