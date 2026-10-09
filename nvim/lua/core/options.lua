local options = {
  mouse = 'a', -- mouse support
  encoding = 'utf-8', -- default encoding
  fileencoding = 'utf-8',
  fileformat = 'unix',
  number = true, -- line numbers
  numberwidth = 4, -- number column width
  cursorline = false, -- disable highlight current cursor's line
  swapfile = false, -- disable .swp files
  scrolloff = 7, -- number of lines left visible above/below the cursor when scrolling
  tabstop = 2, -- spaces instead of one tab
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true, -- replace tab with spaces
  autoindent = true, -- save indent on new line
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  termguicolors = true, -- enables 24-bit RGB color in the TUI
  wrap = false, -- display lines as one long line
}

local globals = {
  mapleader = ' ',
}

set_options(options)
set_globals(globals)
