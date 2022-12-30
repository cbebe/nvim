local go_group = vim.api.nvim_create_augroup("GOGroup", { clear = true })

-- Run go
vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Run go file",
  pattern = "*.go",
  callback = function()
    vim.keymap.set("n", "<leader>G", "<cmd>!go run %<cr>")
  end,
  group = go_group
})
