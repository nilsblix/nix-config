function ColorMyself(color)
	color = color or "vague"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.cmd("highlight SignColumn guibg=NONE")
	vim.cmd("highlight LineNr guibg=NONE")

	vim.api.nvim_set_hl(0, "StatusLine", { fg = "#646475", bg = "#0e0e12" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#3c3836", bg = "#0e0e12" })
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
}
