-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
vim.opt.wrap = true

vim.opt.spell = true
-- When there is lack of .spl file download it from there: https://ftp.nluug.nl/vim/runtime/spell/ and place it in: ~/.local/share/nvim/site/spell/
-- mkdir -p ~/.local/share/nvim/site/spell && curl -fLo ~/.local/share/nvim/site/spell/pl.utf-8.spl https://ftp.nluug.nl/vim/runtime/spell/pl.utf-8.spl
vim.opt.spelllang = { "pl", "en" }
