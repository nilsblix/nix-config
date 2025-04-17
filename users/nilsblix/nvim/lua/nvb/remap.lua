vim.g.mapleader = " "

vim.keymap.set("n", "<leader>N", ":Ex<CR>")

vim.keymap.set("n", "<C-c>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "<leader>h", "_")
vim.keymap.set("n", "<leader>e", "$")

vim.keymap.set("n", "<leader>p", "<C-^>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
