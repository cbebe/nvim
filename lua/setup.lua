require 'configs.lualine'

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

require 'configs.gitsigns'
require 'configs.telescope'
require 'configs.treesitter'

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

require 'configs.lsp'

require 'configs.cmp'
-- Make background transparent
-- vim.cmd([[
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
--   highlight Normal guibg=none
--   highlight NonText guibg=none
-- ]])

require("leap").add_default_mappings()

require 'custom.autocmds'

-- vim: ts=2 sts=2 sw=2 et
