-- plugins/mason.lua
return { 
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "pyright",
        "clangd",
        "shfmt",
        "stylua", -- Lua
        "black", -- Python
        "prettier", -- JS/TS/CSS/HTML
        "clang-format", -- C/C++
        "mypy",
        "lua-language-server",
        "debugpy",
        "tree-sitter-cli",
      },
    },
}
