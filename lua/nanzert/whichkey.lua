local wk = require("which-key")

local setup = {
}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local mappings = {
    f = { require("telescope").extensions.menufacture.find_files, "Find files" },
    F = { require("telescope").extensions.menufacture.live_grep, "Find text" },
    b = { require("telescope.builtin").buffers, "Find buffers" },
    l = {
        name = "LSP",
        f = { function() vim.lsp.buf.format { async = true } end, "Format" },
        a = { vim.lsp.buf.code_action, "Code actiond" },
        q = { vim.diagnostic.setloclist, "Local quickfix" },
        Q = { vim.diagnostic.setqflist, "Quickfix" },
        r = { vim.lsp.buf.rename, "Rename" },
        h = { function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = nil })) end, "Inlay hints" },
    },
	h = {
		name = "Harpoon",
		a = { require('harpoon.mark').add_file, "Add File" },
		c = { require('harpoon.ui').toggle_quick_menu, "Quick Menu" },
        j = { function() require('harpoon.ui').nav_file(1) end, "Next File" },
        k = { function() require('harpoon.ui').nav_file(-1) end, "Prev File" },
	},
    hl = { "<cmd>nohlsearch<CR>", "No Highlight" },
    d = {
        name = "Debug",
        d = { require("dapui").toggle, "Debug UI" },
        c = { require("dap").continue, "Continue" },
        h = { require("dap").step_back, "Step back" },
        sj = { require("dap").step_into, "Step into" },
        sk = { require("dap").step_out, "Step out" },
        l = { require("dap").step_over, "Step over" },
        e = { require("dapui").eval, "Eval" },
        b = { require("dap").toggle_breakpoint, "Breakpoint" },
        j = { require("dap").down, "Down" },
        k = { require("dap").up, "Up" },
        r = { require("dap").run_to_cursor, "Run to cursor" },
        t = { require("dap").terminate, "Terminate" },
        ["<leader>"] = { require("dap").run_last, "Run last" },
    },
    ["/"] = { require("Comment.api").toggle.linewise.current, "Comment" },
}

local vopts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local vmappings = {
    ["/"] = { '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>', "Comment" },
    d = {
        name = "Debug",
        e = { require("dapui").eval, "Eval" },
    },
}

wk.setup(setup)
wk.register(mappings, opts)
wk.register(vmappings, vopts)
