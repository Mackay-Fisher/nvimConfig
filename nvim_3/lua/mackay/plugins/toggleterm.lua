return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				on_open = function(term)
					-- Example key mappings inside ToggleTerm
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"t",
						"<esc>",
						[[<C-\><C-n>]],
						{ noremap = true, silent = true }
					)
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"t",
						"jk",
						[[<C-\><C-n>]],
						{ noremap = true, silent = true }
					)
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"t",
						"<C-h>",
						[[<C-\><C-n><C-W>h]],
						{ noremap = true, silent = true }
					)
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"t",
						"<C-j>",
						[[<C-\><C-n><C-W>j]],
						{ noremap = true, silent = true }
					)
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"t",
						"<C-k>",
						[[<C-\><C-n><C-W>k]],
						{ noremap = true, silent = true }
					)
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"t",
						"<C-l>",
						[[<C-\><C-n><C-W>l]],
						{ noremap = true, silent = true }
					)
				end,
			})
		end,
	},
}
