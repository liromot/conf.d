local theme = 'gruvbox'

require 'core'
require 'plugin-loader'

pcall(require, 'plugins.theme' .. theme)
vim.cmd.colorscheme(theme)
