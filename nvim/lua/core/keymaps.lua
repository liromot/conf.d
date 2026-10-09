local modes = {
  normal = 'n',
  insert = 'i',
  terminal = 't',
  visual = 'v',
  visual_block = 'x',
  command = 'c',
}

local keymaps = {
    [modes.normal] = {
        -- movement
        ['<C-l>'] = { cmd = '$', desc = 'End of line' },
        ['<C-h>'] = { cmd = '0', desc = 'Start of line',},

        -- windows
        ['<A-j>'] = { cmd = '<C-w>j', desc = 'Go to upper window' },
        ['<A-k>'] = { cmd = '<C-w>k', desc = 'Go to lower window' },
        ['<A-h>'] = { cmd = '<C-w>h', desc = 'Go to left window' },
        ['<A-l>'] = { cmd = '<C-w>l', desc = 'Go to right window' },
        ['<A-\\>'] = { cmd = '<C-w>v', desc = 'Split window vertically' },
        ['<A-->'] = { cmd = '<C-w>s', desc = 'Split window horizontally' },
        ['<A-q>'] = { cmd = ':q<cr>', desc = 'Close window' },

        -- tabs
        ['<C-Left>'] = { cmd = ':tabprevious<CR>', desc = 'Go to previous tab' },
        ['<C-Right>'] = { cmd = ':tabnext<CR>', desc = 'Go to next tab' },
        ['<C-Up>'] = { cmd = ':tabnew<CR>', desc = 'New tab' },
        ['<C-Down>'] = { cmd = ':tabclose<CR>', desc = 'Close tab' },
    },
}

for mode, keys in pairs(keymaps) do
  set_keymaps(mode, keys)
end
