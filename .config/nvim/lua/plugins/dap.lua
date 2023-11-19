



require("nvim-dap-virtual-text").setup()
require('telescope').load_extension('dap')


-- Set Debug motion mappings
-- vim.keymap.set('n', '<localleader><localleader>d', function()
    vim.keymap.set('n', '<C-b>', '<cmd> lua require("dap").toggle_breakpoint()<CR>', opts)
    vim.keymap.set('n', '<leader>j', '<cmd> lua require("dap").continue()<CR>', opts)
    vim.keymap.set('n', '<leader>k', '<cmd> lua require("dap").close()<CR>', opts)
    vim.keymap.set('n', '<leader>i', '<cmd> lua require("dap").step_into()<CR>', opts)
    vim.keymap.set('n', '<leader>o', '<cmd> lua require("dap").step_out()<CR>', opts)
    vim.keymap.set('n', '<leader>n', '<cmd> lua require("dap").step_over()<CR>', opts)
-- end)




vim.keymap.set('n', '<leader>dc', '<cmd>lua require("dap").clear_breakpoints()<CR>', opts)
vim.keymap.set('n', '<leader>dr', '<cmd> lua require("dap").repl.open()<CR>', opts)

vim.keymap.set('n', '<leader>sb', '<cmd>Telescope dap list_breakpoints<CR>', opts)
vim.keymap.set('n', '<leader>sd', "<cmd>Telescope dap commands<CR>", opts)





require("dapui").setup({
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
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        -- "breakpoints",
        "stacks",
        "console",
        -- "watches",
      },
      size = 40, -- 40 columns
      position = "right",
    },
    -- {
    --   elements = {
    --     "repl",
    --     "console",
    --   },
    --   size = 0.25, -- 25% of total lines
    --   position = "bottom",
    -- },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = false,
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
    border = "single", -- Border style. Can be "single", "double" or "rounded"
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



vim.keymap.set('n', '<leader>do', '<cmd>lua require("dapui").toggle()<CR>', opts)



--------------- Adapter setup ---------------

-- Python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')


-- -- -- Javascript
-- local dap = require('dap')
-- dap.adapters.firefox = {
--   type = 'executable',
--   command = 'node',
--   args = {os.getenv('HOME') .. '/Repos/vscode-firefox-debug/dist/adapter.bundle.js'},
-- }

-- -- dap.configurations.typescript = {
-- dap.configurations.html = {
--   {
--   name = 'Debug with Firefox',
--   type = 'firefox',
--   request = 'launch',
--   reAttach = true,
--   url = 'http://localhost:3000',
--   webRoot = '${workspaceFolder}',
--   firefoxExecutable = '/usr/bin/firefox'
--   }
-- }

-- TODO
-- require("dap").adapters["pwa-node"] = {
--   type = "server",
--   host = "localhost",
--   port = "${port}",
--   executable = {
--     command = "node",
--     -- 💀 Make sure to update this path to point to your installation
--     args = {"/path/to/js-debug/src/dapDebugServer.js", "${port}"},
-- /home/jensjp/.local/share/nvim/site/pack/packer/opt/vscode-js-debug
--             os.getenv("HOME") .. "/.local/share/nvim/site/pack/packer/opt/vscode-js-debug/src/dapDebugServer.js",
--   }
-- }
require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  -- port = "${port}",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = {"/home/jensjp/Repos/js-debug/src/dapDebugServer.js", "${port}"},
  }
}
require("dap").configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
