require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "pyright", "rust-analyzer", "luals", "gdscript" }
vim.lsp.enable(servers)


