return {
	"ray-x/lsp_signature.nvim",
	keys = { "<C-k>" }, -- Lazy load on <C-k>
	opts = {},
	config = function(_, opts)
		require 'lsp_signature'.setup(opts)
		vim.keymap.set({ 'n' }, '<C-k>', function()
			require('lsp_signature').toggle_float_win()
		end, { silent = true, noremap = true, desc = 'toggle signature' })
	end
}
