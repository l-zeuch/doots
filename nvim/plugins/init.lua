return {
    { "andweeb/presence.nvim" },

    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'onsails/lspkind-nvim' },
    { 'dense-analysis/ale' },
    { 'arcticicestudio/nord-vim' },
    { 'fatih/vim-go', run = ':goupdatebinaries', ft = 'go' },
    { 'junegunn/vader.vim', cmd = 'vader', ft = 'vader' },
    { 'xuhdev/vim-latex-live-preview', cmd = 'llpstartpreview' },
    { 'editorconfig/editorconfig-vim' },
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
    {
        'sQVe/sort.nvim',
        config = function()
            require'sort'.setup({})
        end,
    },

    ["declancm/cinnamon.nvim"] = { disable = true },
    ["Darazaki/indent-o-matic"] = { disable = true },
}
