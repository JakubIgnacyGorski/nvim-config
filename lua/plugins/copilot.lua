return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  lazy = false,
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        refresh = "gr",
        open = "<M-CR>",
      },
    },
  },
  config = function()
    -- github copilot
    vim.keymap.set("n", "<leader>ma", "<Cmd>Copilot! attach<CR>", { desc = "copilot attach (forced)", silent = true })
    vim.keymap.set("n", "<leader>md", "<Cmd>Copilot detach<CR>", { desc = "copilot detach", silent = true })
    vim.keymap.set("n", "<leader>mS", "<Cmd>Copilot status<CR>", { desc = "copilot status", silent = true })
    require("copilot").setup({
      panel = { enabled = false },
      suggestion = {
        enabled = true, -- we use blink-cmp + plugin for copilot
        auto_trigger = true, -- start as soon as insert mode is active
      },
      filetypes = {
        ["*"] = false, -- disable for all filetypes (`:Copilot! attach` will work, though)
      },
    })
  end,
}
