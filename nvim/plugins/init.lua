return {
  { "andweeb/presence.nvim" },

  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  { 'onsails/lspkind-nvim' },
  { 'dense-analysis/ale' },
  { 'arcticicestudio/nord-vim' },
  {
    'hrsh7th/cmp-cmdline',
    after = "nvim-cmp",
    config = function()
      local cmp = require "cmp"
      local config = cmp.get_config()
      table.insert(config.sources, { name = 'cmdline' })
      cmp.setup(config)
    end,
  },
  {
    'l-zeuch/yagpdb.vim',
    config = function()
      local cmp = require "cmp"
      local config = cmp.get_config()
      table.insert(config.sources, { name = 'yagpdb-cc' })
      cmp.setup(config)
    end,
  },

  { 'fatih/vim-go', run = ':GoUpdateBinaries', ft = 'go' },
  { 'junegunn/vader.vim', cmd = 'Vader', ft = 'vader' },
  { 'xuhdev/vim-latex-live-preview', cmd = 'LLPStartPreview' },
  {
  'sQVe/sort.nvim',
  config = function()
    require'sort'.setup({})
  end,
  },
}
