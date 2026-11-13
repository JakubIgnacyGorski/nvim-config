return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          prepend_args = function(self, ctx)
            local wrap80 = vim.b[ctx.buf].wrap80_enabled or false

            return {
              "--prose-wrap",
              wrap80 and "always" or "preserve",
              "--print-width",
              "80",
            }
          end,
        },
      },
    },
  },
}
