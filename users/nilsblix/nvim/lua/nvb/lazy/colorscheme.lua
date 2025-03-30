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
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
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
			-- ColorMyself()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				dim_inactive = false,
				transparent_mode = false,
				undercurl = false,
				underline = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					folds = false,
					operators = false,
				},
				overrides = {
					StatusLine = { bg = "#ababab", fg = "#3E1018" },
					StatusLineNC = { bg = "#3c3836", fg = "#1E2018" },
				},
			})
			vim.cmd.colorscheme("gruvbox")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

			vim.cmd("highlight SignColumn guibg=NONE")
			vim.cmd("highlight LineNr guibg=NONE")
		end,
	},
}
