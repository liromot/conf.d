function _G.set_option(name, value)
  vim.opt[name] = value
end

function _G.set_options(options)
  for name, value in pairs(options) do
    set_option(name, value)
  end
end

function _G.set_global(name, value)
  vim.g[name] = value
end

function _G.set_globals(globals)
  for name, value in pairs(globals) do
    set_global(name, value)
  end
end

function _G.set_keymap(mode, keymap, cmd, opt, desc)
  vim.keymap.set(mode, keymap, cmd, opt, { desc = desc or "" })
end

function _G.set_keymaps(mode, keymaps)
  for keymap, value in pairs(keymaps) do
    if value.opt ~= nil then
      set_keymap(mode, keymap, value.cmd, value.opt, value.desc)
    else
      local opt = { silent = true }

      if mode == 'c' then
        opt = { expr = true }
      end

      set_keymap(mode, keymap, value.cmd, opt, value.desc)
    end
  end
end
