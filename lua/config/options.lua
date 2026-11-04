require("config.remote_clipboard").setup()
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.wrap = true

vim.opt.spell = true
-- When there is lack of .spl file download it from there: https://ftp.nluug.nl/vim/runtime/spell/ and place it in: ~/.local/share/nvim/site/spell/
-- mkdir -p ~/.local/share/nvim/site/spell && curl -fLo ~/.local/share/nvim/site/spell/pl.utf-8.spl https://ftp.nluug.nl/vim/runtime/spell/pl.utf-8.spl
vim.opt.spelllang = { "pl", "en" }

-- Remove modeline due to STM32CubeMX code problems
vim.o.modeline = false

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"
