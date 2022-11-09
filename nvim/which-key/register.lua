local utils = require "user.utils"

local wk = {
  n = {
    -- second key is the prefix, <leader> prefixes
    ["<leader>"] = {
      b = {
        name = "Buffer",
        b = { "<cmd>tabnew<cr>", "New tab" },
        c = { "<cmd>BufferLinePickClose<cr>", "Pick to close" },
        j = { "<cmd>BufferLinePick<cr>", "Pick to jump" },
        t = { "<cmd>BufferLineSortByTabs<cr>", "Sort by tabs" },
        w = { "<cmd>set list!<cr>", "Toggle whitespaces" },
      },
    },
  },
}

return wk
