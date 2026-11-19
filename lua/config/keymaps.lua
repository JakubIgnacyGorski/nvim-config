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

-- Toggle modeline
Snacks.toggle({
  name = "Modeline",
  get = function()
    return vim.o.modeline
  end,
  set = function(state)
    vim.o.modeline = state
  end,
}):map("<leader>uM")

-- Toggle CSV View
Snacks.toggle({
  name = "CSV View",
  get = function()
    return vim.b.csvview_enabled or false
  end,
  set = function(state)
    if state then
      vim.cmd("CsvViewEnable")
    else
      vim.cmd("CsvViewDisable")
    end
    vim.b.csvview_enabled = state
  end,
}):map("<leader>uH")
