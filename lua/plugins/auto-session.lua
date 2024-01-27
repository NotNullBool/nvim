return {
	"rmagatti/auto-session",
	keys = {
		{ "<leader>asr", "<cmd>SessionRestore<CR>",  desc = "Restore session for cwd" },
		{ "<leader>ass", "<cmd>SessionSave<CR>", desc = "Save session for auto session root dir" }
	},
	opts = {
		auto_restore_enabled = false,
		auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
	}
}
