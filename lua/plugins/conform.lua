return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          prepend_args = function(self, ctx)
            local width = vim.b[ctx.buf].wrap80_enabled and "80" or "120"
            return {
              "--print-width",
              width,
              "--prose-wrap",
              "always",
            }
          end,
        },
      },
    },
  },
}
