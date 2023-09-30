local M = {
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	config = function() end,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		--Please make sure you install markdown and markdown_inline parser
		{ "nvim-treesitter/nvim-treesitter" },
	},
}

function M.config()
	local saga = require("lspsaga")
	saga.setup({
		ui = {
			winblend = 10,
			border = "rounded",
			colors = {
				normal_bg = "#002b36",
			},
		},
	})

	local diagnostic = require("lspsaga.diagnostic")
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "[e", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "e[", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
	vim.keymap.set("n", "gD", "<Cmd>Lspsaga goto_definition<CR>", opts)
	-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
	vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)

	-- code action
	vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<cr>", opts)
	vim.keymap.set("v", "<leader>ca", "<Cmd>Lspsaga code_action<cr>", opts)

	-- terminal
	vim.keymap.set("n", "<leader>t", "<Cmd>Lspsaga term_toggle<CR>", opts)
end

return M
