local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
    return
end

local lspconfig = require("lspconfig")

--[[ local servers = { "pyright", "jsonls", "lua_ls", "dockerls", "remark_ls", "bashls", "rust_analyzer" } ]]
local servers = { "pyright", "jsonls", "dockerls", "remark_ls", "bashls", "rust_analyzer" }

lsp_installer.setup {
    ensure_installed = servers
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end
    lspconfig[server].setup(opts)
end
