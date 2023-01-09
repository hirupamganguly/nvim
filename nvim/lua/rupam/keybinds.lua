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

--

