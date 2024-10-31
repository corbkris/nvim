return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-plenary",
			{ "fredrikaverpil/neotest-golang", version = "*" },
			{ "rouge8/neotest-rust" },
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-golang"),
					require("neotest-rust"),
					require("neotest-plenary"),
				}
			})



			vim.keymap.set("n", "<leader>tn", function()
				neotest.run.run()
			end)

			vim.keymap.set("n", "<leader>tw", function()
				neotest.output_panel.toggle()
			end)

			vim.keymap.set("n", "<leader>tt", function()
				neotest.summary.toggle()
			end)
		end,
	},
}
