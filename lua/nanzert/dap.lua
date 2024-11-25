require('dapui').setup()
require("dap-python").setup("python")
require("nvim-dap-virtual-text").setup()
local dap = require("dap")
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
}
dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Attach to process",
        type = "gdb",
        request = "attach",
        pid = function()
            return tonumber(vim.fn.input('PID of process: '))
        end
    },
}
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Attach to process",
        type = "gdb",
        request = "attach",
        pid = function()
            return tonumber(vim.fn.input('PID of process: '))
        end
    },
}
