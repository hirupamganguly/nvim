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


## Notes:= 
-- Copy entire buffer.
keymap.set("n", "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" })

-- Move current line up and down
keymap.set("n", "<A-k>", '<cmd>call utils#SwitchLine(line("."), "up")<cr>', { desc = "move line up" })
keymap.set("n", "<A-j>", '<cmd>call utils#SwitchLine(line("."), "down")<cr>', { desc = "move line down" })


-- Switch windows
keymap.set("n", "<left>", "<c-w>h")
keymap.set("n", "<Right>", "<C-W>l")
keymap.set("n", "<Up>", "<C-W>k")
keymap.set("n", "<Down>", "<C-W>j")


-- Go to the beginning and end of current line in insert mode quickly
keymap.set("i", "<C-A>", "<HOME>")
keymap.set("i", "<C-E>", "<END>")



-- Go to beginning of command in command-line mode
keymap.set("c", "<C-A>", "<HOME>")



-- Delete the character to the right of the cursor
keymap.set("i", "<C-D>", "<DEL>")




-- Reload current file
keymap("n", "<leader>rn", ":so %<CR>", opts)




-- nvim-dap
keymap("n", "<leader>wb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>wc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>wo", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>wi", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>wr", "<cmd>lua require'dap'.repl.open()<cr>", opts)


-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })


-- toggle options
map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })










# force a reload of the config file
unbind-key r
bind-key r source-file ~/.tmux.conf \; display "tmux configuration reloaded !!"

# Force tmux to use utf-8
setw -gq utf8 on

#--------------------------------------------------------------------------------
# General
#--------------------------------------------------------------------------------

set-option -g default-terminal "screen-256color"

# Tell tmux that outside terminal supports true colour
set-option -sa terminal-overrides ",xterm-256color:RGB"


# Use xterm sequences
set-window-option -g xterm-keys on

# 1 based index for windows 
set -g base-index 1

# No delay for escape key press, otherwise vim Esc slows down
set -s escape-time 0

# increase repeat timeout
set -sg repeat-time 600

# disable various messages
set -s focus-events on

# expect UTF-8 (tmux < 2.2)
set -q -g status-utf8 on
setw -q -g utf8 on

# boost history
set -g history-limit 100000

#--------------------------------------------------------------------------------
# Display
#--------------------------------------------------------------------------------

# 1 based index for windows
set -g base-index 1

# make pane numbering consistent with windows
setw -g pane-base-index 1

# Aggressive resize makes tmux resize if a smaller client is active
setw -g aggressive-resize on

# Info
set -g set-titles on                        # set terminal title
set -g set-titles-string '#h ❐ #S ● #I #W'

set -g display-panes-time 800 # slightly longer pane indicators display time
set -g display-time 1000      # slightly longer status messages display time

set -g status-interval 60     # redraw status line every 10 seconds
set -g status-left-length 15
#set -g status-justify centre

# notify us of any activity in other windows
set -g monitor-activity on
set -g visual-activity off

# Disable auto renaming of windows
set -g allow-rename off

# Enable mouse support.
set -g mouse on

# enable vi keys
setw -g mode-keys vi

#--------------------------------------------------------------------------------
# Navigation
#--------------------------------------------------------------------------------

# Vertical and horizontal splitting
bind-key | split-window -h -c "#{pane_current_path}"
bind-key - split-window -v -c "#{pane_current_path}"

# Home row movement between panes (without prefix).
bind-key -n C-M-j select-pane -D
bind-key -n C-M-k select-pane -U
bind-key -n C-M-h select-pane -L
bind-key -n C-M-l select-pane -R

# quick pane cycling
unbind-key ^A
bind-key ^A select-pane -t :.+

# Home row movement between windows (with prefix).
bind-key -r C-h previous-window
bind-key -r C-l next-window

# Go to last window (with prefix).
bind-key -r C-a last-window

# Moving panes (without prefix).
bind-key -n C-M-Up    rotate-window -U      # rotate window 'up' (moves all panes).
bind-key -n C-M-Down  rotate-window -D      # rotate window 'down' (moves all panes).
bind-key -n C-M-Left  swap-pane -dU         # Swap with the previous pane.
bind-key -n C-M-Right swap-pane -dD         # Swap with the next pane.

# C-b ! => Move the current pane into a new separate window (break pane).

# Moving windows
bind-key -r < swap-window -t -1
bind-key -r > swap-window -t +1

# Resizing Panes using home row keys
bind-key -r M-Left resize-pane -L 10
bind-key -r M-Right resize-pane -D 10
bind-key -r M-Up resize-pane -U 10
bind-key -r M-Down resize-pane -R 10

# Resizing Panes using arrow keys.
bind-key -r M-Left resize-pane -L 7
bind-key -r M-Right resize-pane -R 7
bind-key -r M-Up resize-pane -U 7
bind-key -r M-Down resize-pane -D 7

# copy and paste with system clipboard using xclip
bind-key C-c run "tmux save-buffer - | xclip -i -sel clipboard"
bind-key C-v run "tmux set-buffer \"$(xclip -o -sel clipboard)\"; tmux paste-buffer"

#--------------------------------------------------------------------------------
# Themes
#--------------------------------------------------------------------------------

#source tmuxline.conf
if-shell "test -f ~/dot-tmux/tmuxline.conf" "source ~/dot-tmux/tmuxline.conf"

#================================================================================
# Plugins
#--------------------------------------------------------------------------------
# List of plugins (via tmux-plugin-manager which must be cloned manually)
#
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-logging'

# Plugin speicifc options

# tmux-resurrect options
set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-dir '$HOME/.tmux/resurrect/$HOSTNAME'
set -g @resurrect-strategy-vim 'session'
set -g @resurrect-strategy-nvim 'session'

# tmux-continuum options
set -g @continuum-restore 'on'

# Initialize TMUX plugin manager (must be at the botton of this file)
run '~/.tmux/plugins/tpm/tpm'
