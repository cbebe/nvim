-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Use system clipboard
vim.o.clipboard = 'unnamedplus'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.g.suda_smart_edit = 1
-- Use deno for formatting
vim.g.neoformat_enabled_typescript = { "denofmt" }
vim.g.neoformat_enabled_typescriptreact = { "denofmt" }
vim.g.neoformat_enabled_javascript = { "denofmt" }
vim.g.neoformat_enabled_javascriptreact = { "denofmt" }
vim.g.neoformat_enabled_markdown = { "denofmt" }
vim.g.neoformat_enabled_json = { "denofmt" }
vim.g.blamer_delay = 500

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


local function printDate()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local date = os.date()
  local nline = line:sub(0, pos) .. date .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

vim.keymap.set('n', '<leader>D', printDate, { desc = 'Print the date' })


local sets_lua_path = "<cmd>e ~/.dotfiles/config/.config/nvim/lua/sets.lua<cr>"
local term_cmd = "<cmd>terminal<cr>i"
if vim.loop.os_uname().sysname == "Windows_NT" then
  -- nushell
  term_cmd = "<cmd>terminal<cr>inu<cr>"
  -- This will break tempfile redirection!!
  -- TODO: Find alternative ways to create terminal

  -- vim.o.shell = "nu"
  -- vim.o.shellpipe = "| save %s"
  -- vim.o.shellredir = "| save %s"
  -- vim.o.shellcmdflag = '-c'
  -- vim.o.shellquote = ""
  -- vim.o.shellxquote = ""

  sets_lua_path = "<cmd>e ~/AppData/Local/nvim/lua/sets.lua<cr>"
end
vim.keymap.set('n', '<leader>E', sets_lua_path, { desc =  "[E]dit user configuration" })
vim.keymap.set("n", "<leader>tt", term_cmd, { desc = "Open terminal" })
vim.keymap.set('n', '<leader>cd', "<cmd>cd %:p:h<cr>",{ desc = "[C]hange current [D]irectory to the file in the buffer" })
vim.keymap.set('n', '<leader>F', "<cmd>Neoformat<cr>",{ desc = "[F]ormat file" })
vim.keymap.set('n', '<leader>d', '<cmd>bd<cr>', { desc = '[D]elete buffer' })

-- vim: ts=2 sts=2 sw=2 et
