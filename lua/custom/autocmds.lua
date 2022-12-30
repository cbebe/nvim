local function printDate()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local date = os.date()
  local nline = line:sub(0, pos) .. date .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

local function CreateTrailingCmd(auto, group, cb)
  local function callback()
    local bt = vim.bo.buftype
    local ft = vim.bo.filetype
    if bt ~= "nofile" and ft ~= "" and ft ~= "neo-tree" then
      cb()
    end
  end

  local desc = "Match extra whitespace on " .. auto
  vim.api.nvim_create_autocmd(auto, { desc = desc, group = group, pattern = "*", callback = callback })
end

-- Set autocommands
vim.api.nvim_create_augroup("ShowDiagnostics", {})
vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
  desc = "Show line diagnostics automatically in hover window",
  group = "ShowDiagnostics",
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

vim.cmd([[ highlight ExtraWhitespace ctermbg=red guibg=red ]])
local match_group = vim.api.nvim_create_augroup("MatchTrailing", { clear = true })
CreateTrailingCmd("BufWinEnter", match_group, function()
  vim.cmd([[ match ExtraWhitespace /\s\+$/ ]])
end)
CreateTrailingCmd("InsertEnter", match_group, function()
  vim.cmd([[ match ExtraWhitespace /\s\+\%#\@<!$/ ]])
end)
CreateTrailingCmd("InsertLeave", match_group, function()
  vim.cmd([[ match ExtraWhitespace /\s\+$/ ]])
end)
CreateTrailingCmd("BufWinLeave", match_group, function()
  vim.cmd([[ call clearmatches() ]])
end)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

