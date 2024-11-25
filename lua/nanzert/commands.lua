vim.api.nvim_create_user_command('DapExcept', function(opts)
    require('dap').defaults.fallback.exception_breakpoints = opts.fargs
    require('dap').set_exception_breakpoints(opts.fargs)
end, { nargs = "*" })
