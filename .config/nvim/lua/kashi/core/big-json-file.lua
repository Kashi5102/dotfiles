-- preformat json with jq
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
	pattern = "*.json",
	command = ":%!jq .",
})
