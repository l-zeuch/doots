local config = {

    -- Set colorscheme
    colorscheme = "nord",

    -- Default theme configuration
    default_theme = {
        -- Modify the color table
        colors = {
            fg = "#abb2bf",
        },
        -- Modify the highlight groups
        highlights = function(highlights)
            local C = require "default_theme.colors"

            highlights.Normal = { fg = C.fg, bg = C.bg }
            return highlights
        end,
    },

    -- Disable AstroVim ui features
    ui = {
        nui_input = true,
        telescope_select = true,
    },

    -- Modify which-key registration
    ["which-key"] = {
        -- Add bindings to the normal mode <leader> mappings
        register_n_leader = {
            ["fl"] =  { "<cmd>set list!<CR>", "Toggle Whitespaces"},
        },
    },

    -- Extend LSP configuration
    lsp = {
        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {
            yamlls = {
                settings = {
                    yaml = {
                        schemas = {
                            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                            ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        },
                    },
                },
            },
        },
    },

    -- null-ls configuration
    ["null-ls"] = function()
        -- Formatting and linting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim
        local status_ok, null_ls = pcall(require, "null-ls")
        if not status_ok then
            return
        end

        -- Check supported formatters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        local formatting = null_ls.builtins.formatting

        -- Check supported linters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup {
            debug = false,
            sources = {
                -- Set a formatter
                formatting.rufo,
                -- Set a linter
                diagnostics.rubocop,
            },
            -- NOTE: You can remove this on attach function to disable format on save
            on_attach = function(client)
                if client.resolved_capabilities.document_formatting then
                    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
                end
            end,
        }
    end,

    options = {
        opt = {
            relativenumber = false,
            textwidth = 80,
            tabstop = 8,
            softtabstop = 4,
            shiftwidth = 4,
            expandtab = true,
            laststatus = 2,
            listchars="tab:→\\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»",
        },
    },

    -- This function is run last
    -- good place to configure mappings and vim options
    polish = function()
        local opts = { noremap = true, silent = true }
        local map = vim.api.nvim_set_keymap
        local g = vim.g

        g.yagpdbcc_override_ft = 1

        g.ale_sign_error = ' '
        g.ale_sign_warning = ' '

        g.livepreview_previewer = 'xreader'

        -- Set key bindings
        map("n", "<C-s>", ":w!<CR>", opts)

        -- Set autocommands
        vim.api.nvim_del_augroup_by_name "alpha_settings"

        vim.api.nvim_create_augroup("remove_trailing_spaces", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Remove trailing whitespaces before writing",
            group = "remove_trailing_spaces",
            pattern = "*",
            command = ":%s/\\s\\+$//e",
        })

        vim.api.nvim_create_augroup("packer_conf", {})
        vim.api.nvim_create_autocmd("BufWritePost", {
            desc = "Run packersync on update of plugin file",
            group = "packer_conf",
            pattern = "plugins.lua",
            command = "source <afile> | PackerSync",
        })

        vim.cmd [[
        filetype plugin indent on
        syntax enable

        let g:fsharp#backend = "nvim"
        ]]
    end,
}
return config
