function ColorMyself(color)
	color = color or "tokyonight-storm"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.cmd("hi Comment cterm=NONE gui=NONE")
	vim.cmd("hi Keyword cterm=NONE gui=NONE")
	vim.cmd("hi Identifier cterm=NONE gui=NONE")
	vim.cmd("hi Type cterm=NONE gui=NONE")
	vim.cmd("hi Function cterm=NONE gui=NONE")

	vim.cmd("highlight SignColumn guibg=NONE")
	vim.cmd("highlight LineNr guibg=NONE")
end

return {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					functions = { italic = false },
					variables = { italic = false },
				},
			})
			ColorMyself()
		end,
	},
}
