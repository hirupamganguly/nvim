local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim tab
map('n', '<C-Q>', '<CMD>q<CR>') -- CTRL + q

-- Move to the next/previous buffer
map('n', '<C-[>', '<CMD>bp<CR>')
map('n', '<C-]>', '<CMD>bn<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-h>', '<CMD>vsplit<CR>') -- CTRL + h
map('n', '<C-v>', '<CMD>split<CR>') -- CTRL + v
-- Move the cursor 50 lines UP/DOWS
map('n', '<C-Up>', '50k')
map('n', '<C-Down>', '50j')

-- Toggle NvimTree
map('n', '<c-n>', ':NvimTreeFindFileToggle<CR>') -- CTRL + n

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
-- CTRL+v to Paste in InsertMode
map('i','<C-v>','<C-r>*')

--:lua vim.lsp.buf.definition()
-- lsp.buf.definition in InsertMode
vim.keymap.set('n', '<C-LeftMouse>', function()
 vim.cmd [[
  :lua vim.lsp.buf.definition()
]]
end, { expr = true })
-- SAVE file in InsertMode
vim.keymap.set('i', '<C-d>', function()
 vim.cmd [[
  :w
]]
end, { expr = true })
