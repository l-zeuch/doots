local status_ok, _ = pcall(require, "feline")
if status_ok then
  local C = require "default_theme.colors"
  local hl = require("core.status").hl
  local modes = require("core.status").modes
  local provider = require("core.status").provider
  local conditional = require("core.status").conditional


local feline = {
  custom_providers = {
    words = function()
      local wc = vim.fn.wordcount()
      local filename = vim.fn.expand("%:t")

      if filename ~= '' then
        return tostring(wc.chars) .. "C " .. tostring(wc.words) .. "W "
      end

      return ''
    end,
    mode = function()
      return modes[vim.fn.mode()][1]
    end,
    filename = function(component)
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local icon = component.icon or
        require'nvim-web-devicons'.get_icon(filename, extension, { default = true })

      if filename == '' then icon = '' end

      return icon .. ' ' .. filename
    end,
  },
	components = {
      active = {
        {
          { provider = provider.spacer(1), hl = hl.mode() },
          { provider = provider.spacer(1) },
          { provider = 'filename' },
          { provider = provider.spacer(1) },
          { provider = provider.spacer(1) },
          { provider = 'words' },
          { provider = provider.spacer(2) },
          { provider = "git_branch", hl = hl.fg("Conditional", { fg = C.purple_1, style = "bold" }), icon = " " },
          { provider = provider.spacer(3), enabled = conditional.git_available },
          { provider = { name = "file_type", opts = { filetype_icon = true, case = "lowercase" } }, enabled = conditional.has_filetype },
          { provider = provider.spacer(2), enabled = conditional.has_filetype },
          { provider = "git_diff_added", hl = hl.fg("GitSignsAdd", { fg = C.green }), icon = "  " },
          { provider = "git_diff_changed", hl = hl.fg("GitSignsChange", { fg = C.orange_1 }), icon = " 柳" },
          { provider = "git_diff_removed", hl = hl.fg("GitSignsDelete", { fg = C.red_1 }), icon = "  " },
          { provider = provider.spacer(2), enabled = conditional.git_changed },
          { provider = "diagnostic_errors", hl = hl.fg("DiagnosticError", { fg = C.red_1 }), icon = "  " },
          { provider = "diagnostic_warnings", hl = hl.fg("DiagnosticWarn", { fg = C.orange_1 }), icon = "  " },
          { provider = "diagnostic_info", hl = hl.fg("DiagnosticInfo", { fg = C.white_2 }), icon = "  " },
          { provider = "diagnostic_hints", hl = hl.fg("DiagnosticHint", { fg = C.yellow_1 }), icon = "  " },
        },
        {
          { provider = provider.lsp_progress, enabled = conditional.bar_width() },
          { provider = provider.lsp_client_names(true), short_provider = provider.lsp_client_names(), enabled = conditional.bar_width(), icon = "   " },
          { provider = provider.spacer(2), enabled = conditional.bar_width() },
          { provider = provider.treesitter_status, enabled = conditional.bar_width(), hl = hl.fg("GitSignsAdd", { fg = C.green }) },
          { provider = provider.spacer(2) },
          { provider = "position" },
          { provider = provider.spacer(2) },
          { provider = "line_percentage" },
          { provider = provider.spacer() },
          { provider = "scroll_bar", hl = hl.fg("TypeDef", { fg = C.yellow }) },
          { provider = provider.spacer(1) },
          { provider = provider.spacer(1), hl = hl.mode() },
          { provider = 'mode', hl = hl.mode() },
          { provider = provider.spacer(1), hl = hl.mode() }
        },
      },

	},
}

return feline

end
