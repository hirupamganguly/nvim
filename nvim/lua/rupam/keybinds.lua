local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end
-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- Move to the next/previous buffer
map('n', '<C-[>', '<CMD>bp<CR>')
map('n', '<C-]>', '<CMD>bn<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-h>', '<CMD>vsplit<CR>')
map('n', '<C-v>', '<CMD>split<CR>')
map('n', '<C-Up>', '50k')
map('n', '<C-Down>', '50j')
map('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Telescope Key Binding which already present in config 
--vim.keymap.set('n', '<c-p>', builtin.find_files, {})
--vim.keymap.set('n', '<space><space>', builtin.oldfiles, {})
--vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<space>fh', builtin.help_tags, {})


--DAP Key Binding which already present in config 
--vim.keymap.set('n', '<space>d', [[:NvimTreeToggle<CR> :lua require('dap').continue()<CR>]], {})
--vim.keymap.set('n', '<space>c', [[:NvimTreeToggle<CR> :lua require('dap').close()<CR>]], {})
--vim.keymap.set('n', '<space>r', [[:NvimTreeToggle<CR> :lua require('dap').repl.close()<CR>]], {})
--vim.keymap.set('n', '<s-b>', [[:lua require('dap').toggle_breakpoint()<CR>]], {})


--CTRL+s to save file instead of :w
map('n', '<C-s>', ':w<CR>')
--CTRL+z to undo
map('n','<C-z>', 'u')
--CTRL+x to redo
map('n','<C-x>','<C-r>')


