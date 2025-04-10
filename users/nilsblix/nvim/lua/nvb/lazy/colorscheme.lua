function ColorMyself(color)
	color = color or "gruvbox"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.cmd("highlight SignColumn guibg=NONE")
	vim.cmd("highlight LineNr guibg=NONE")

	vim.api.nvim_set_hl(0, "StatusLine", { fg = "#646475", bg = "#3E1018" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#3c3836", bg = "#1E2018" })
end

return {
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	{
		"vague2k/vague.nvim",
		config = function()
			ColorMyself("vague")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				dim_inactive = false,
				transparent_mode = true,
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
					StatusLine = { fg = "#646475", bg = "#3E1018" },
					StatusLineNC = { fg = "#3c3836", bg = "#1E2018" },
				},
			})
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
}
