vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.mouse = "a"

vim.opt.scrolloff = 10

vim.cmd("let g:netrw_banner = 0")

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.guicursor = "n-v-i-c:block-Cursor"
