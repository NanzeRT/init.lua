local servers = {
    "lua_ls",
    -- "cssls",
    -- "html",
    -- "tsserver",
    "pyright",
    "ruff_lsp",
    -- "bashls",
    -- "jsonls",
    -- "yamlls",
    "clangd",
    -- "asm_lsp",
    -- "omnisharp",
    -- "rust_analyzer", -- set up by rustaceanvim
    "jdtls",
    "hls",
    -- "solc",
    "csharp_ls",
    "gopls",
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("nanzert.lsp.handlers").on_attach,
        capabilities = require("nanzert.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end
