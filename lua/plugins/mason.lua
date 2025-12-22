return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
        "cmakelang",
        "cmakelint",
        "hadolint",
        "markdownlint-cli2",
        "markdown-toc",
        "prettier",
      },
      function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "codelldb" })
        if diagnostics == "bacon-ls" then
          vim.list_extend(opts.ensure_installed, { "bacon" })
        end
      end,
    },
  },
}
