return {
	cmd = {
		"clangd",
		"--all-scopes-completion",
		"--suggest-missing-includes",
		"--background-index",
		"--pch-storage=disk",
		"--cross-file-rename",
		"--log=info",
		"--completion-style=detailed",
		"--enable-config",
		"--clang-tidy",
		"--offset-encoding=utf-16",
	},
}