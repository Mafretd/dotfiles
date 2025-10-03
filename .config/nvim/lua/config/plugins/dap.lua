return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dap-python").setup("python")
		require("dapui").setup({
			controls = {
				element = "repl",
				enabled = true,
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = "",
				},
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.25,
						},
						{
							id = "breakpoints",
							size = 0.25,
						},
						{
							id = "stacks",
							size = 0.25,
						},
						{
							id = "watches",
							size = 0.25,
						},
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 10,
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		})
		local keymap = vim.keymap.set

		keymap("n", "<Leader>b", dap.toggle_breakpoint, {})
		keymap("n", "<Leader>dc", dap.continue, {})
		keymap("n", "<Leader>B", dap.set_breakpoint, {})
		keymap("n", "<F10>", dap.step_over, {})
		keymap("n", "<F11>", dap.step_into, {})
		keymap("n", "<F12>", dap.step_out, {})

		--Dap signs config
		local signs = vim.fn.sign_define

		signs("DapBreakpoint", { text = "", texthl = "diffRemoved", linehl = "", numhl = "" })
		signs("DapBreakpointCondition", { text = "", texthl = "diffOldFile", linehl = "", numhl = "" })
		signs("DapLogPoint", { text = "", texthl = "diffChanged", linehl = "", numhl = "" })
		signs("DapStopped", { text = "", texthl = "diffNewFile", linehl = "", numhl = "" })
		signs("DapBreakpointRejected", { text = "", texthl = "diffRemoved", linehl = "", numhl = "" })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
