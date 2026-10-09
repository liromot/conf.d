local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

local options = {
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { '--since=3 days ago' }, -- show commits from the last 3 days
    timeout = 300,
    url_format = 'https://github.com/%s.git',
  },
  lockfile = vim.fn.stdpath 'data' .. '/lazy-lock.json', -- lockfile generated after running update
  concurrency = 10, ---@type number limit the maximum amount of concurrent tasks
  install = {
    -- install missing plugins on startup. This doesn't increase startup time
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    -- colorscheme = { "nightly", "habamax" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|
    border = 'rounded',
    throttle = 20, -- how frequently should the ui process render events
    diff = {
      -- diff command <d> can be one of:
      -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
      --   so you can have a different command for diff <d>
      -- * git: will run git diff and open a buffer with filetype git
      -- * terminal_git: will open a pseudo terminal with git diff
      -- * diffview.nvim: will open Diffview to show the diff
      cmd = "git",
    },
  },
  checker = {
    enabled = true, -- automatically check for plugin updates
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath 'state' .. '/lazy/cache',
      disable_events = { 'UIEnter', 'VimEnter', 'BufReadPre' },
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = false, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        'gzip',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'zipPlugin',
      },
    },
  },
}

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup('plugins', options)
