-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>W", "<cmd>noautocmd w<cr>", { desc = "Save without formatting" })

-- Toggle automatic line wrapping at 80 columns
Snacks.toggle({
  name = "Markdown Wrap",
  get = function()
    return vim.b.wrap80_enabled or false
  end,
  set = function(state)
    local buf = vim.api.nvim_get_current_buf()

    vim.b[buf].wrap80_enabled = state
    vim.bo[buf].textwidth = state and 80 or 0
    vim.wo.wrap = true
  end,
}):map("<leader>uW")
