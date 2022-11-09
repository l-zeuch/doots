local plugins = {
  -- Cosmetics
  { 'andweeb/presence.nvim' },
  { 'arcticicestudio/nord-vim' },

  -- Various dev stuff
  { 'tpope/vim-fugitive' },
  { 'junegunn/vader.vim' },
  { 'editorconfig/editorconfig-vim' },
  { 'dhruvasagar/vim-table-mode' },

  -- YAGPDB and Go
  { 'l-zeuch/yagpdb.vim' },
  { 'fatih/vim-go', run = ':GoUpdateBinaries' },

  -- Other
  { 'lervag/vimtex' },

  -- Disable pre-configured plugins
  ["Darazaki/indent-o-matic"] = { disable = true },
}

return plugins
