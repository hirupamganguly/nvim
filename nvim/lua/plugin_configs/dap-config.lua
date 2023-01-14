local dap = require("dap")
dap.adapters.delve = {
 type = 'server',
 port = '${port}',
 executable = {
   command = 'dlv',
   args = {'dap', '-l', '127.0.0.1:${port}'},
 }
}
dap.configurations.go = {
 {
   type = 'delve',
   name = 'Debug',
   request = 'launch',
   program = '${file}'
 },
 {
   type = 'delve',
   name = 'Debug Tests',
   request = 'launch',
   mod = 'test',
   program = '${file}'
 }
}

local dapui = require("dapui")
  dapui.setup({
  icons = { expanded = "", collapsed = "", current_frame = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  
  --expand_lines = vim.fn.has("nvim-0.7") == 1,
  expand_lines = false,
 
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.85 },
        --"stacks",
        --"watches",
      },
      size = 40, 
      position = "left",
    },
    {
      elements = {
        "repl",
        { id = "breakpoints", size = 0.25 },
        --"console",
      },
      size = 0.10, 
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})
-- ui binding
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

--DAP keybindings
vim.keymap.set('n', '<space>d', [[:NvimTreeToggle<CR> :lua require('dap').continue()<CR>]], {}) -- SPACE-d for Start DEBUG
vim.keymap.set('n', '<space>c', [[:NvimTreeToggle<CR> :lua require('dap').close()<CR>]], {}) -- SPACE-c for STOP DEBUG
vim.keymap.set('n', '<space>r', [[:NvimTreeToggle<CR> :lua require('dap').repl.close()<CR>]], {}) -- SPACE-r for STOP Repl
vim.keymap.set('n', '<s-b>', [[:lua require('dap').toggle_breakpoint()<CR>]], {}) -- SHIFT-b for Toggle Breakpoint
