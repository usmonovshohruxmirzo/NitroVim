require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "ts_ls",
        "eslint",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_language_server",
        "jsonls",
        "pyright",
        "csharp_ls",
        "volar",
    },
    automatic_installation = true,
})

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_buf_set_keymap

    map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    map(bufnr, "n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    map(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
end

local lspconfig = require("lspconfig")

local servers = {
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "tailwindcss",
    "emmet_language_server",
    "jsonls",
    "pyright",
    "csharp_ls",
}

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
    })
end
