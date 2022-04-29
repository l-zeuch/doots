local function getWords()
  local wc = vim.fn.wordcount()
  local tmp = tostring(wc.chars) .. "C " .. tostring(wc.words) .. "W"
  return tmp
end

local function get_hl_by_name(name)
  return string.format("#%06x", vim.api.nvim_get_hl_by_name(name.group, true)[name.prop])
end

local function get_hl_prop(group, prop, default)
  local status_ok, color = pcall(get_hl_by_name, { group = group, prop = prop })
  if status_ok then
    default = color
  end
  return default
end

local colors = require "default_theme.colors"

return {
  options = {
    globalstatus = false,
  },
  sections = {
    lualine_a = {
      {
        'fileformat',
      },
      {
        'encoding',
      },
    },
    lualine_y = {
      {
        getWords,
        color = { bg = get_hl_prop("LineNr", "foreground", colors.purple_1), gui = "none" },
      },
    },
    lualine_z = { 'mode' },
  },
}
