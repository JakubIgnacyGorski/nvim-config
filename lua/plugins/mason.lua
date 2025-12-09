-- plugins/mason.lua
return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "black")
    table.insert(opts.ensure_installed, "ruff")
    table.insert(opts.ensure_installed, "pyright")
    table.insert(opts.ensure_installed, "clangd")
    table.insert(opts.ensure_installed, "shfmt")
    table.insert(opts.ensure_installed, "stylua")
    table.insert(opts.ensure_installed, "prettier")
    table.insert(opts.ensure_installed, "clang-format")
    table.insert(opts.ensure_installed, "mypy")
    table.insert(opts.ensure_installed, "lua-language-server")
    table.insert(opts.ensure_installed, "debugpy")
    table.insert(opts.ensure_installed, "tree-sitter-cli")
  end,
}
