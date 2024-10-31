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


			vim.keymap.set("n", "<leader>tr", function()
				neotest.run.run()
			end)

			vim.keymap.set("n", "<leader>trf", function()
				neotest.run.run(vim.fn.expand("%"))
			end)

			vim.keymap.set("n", "<leader>trs", function()
				neotest.run.stop()
			end)

			vim.keymap.set("n", "<leader>tro", function()
				neotest.output.open({ enter = true })
			end)

			vim.keymap.set("n", "<leader>trop", function()
				neotest.output_panel.toggle()
			end)

			vim.keymap.set("n", "<leader>trs", function()
				neotest.summary.toggle()
			end)
		end,
	},
}
