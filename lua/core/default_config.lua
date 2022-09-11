local M = {}

M.options = {
  nvChad = {
    update_url = "https://github.com/azvaliev/NvChad",
    update_branch = "master",
  },
}

M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "nord" },
  theme = "nord", -- default theme
  transparency = false,
}

M.plugins = {}

-- check core.mappings for table structure
M.mappings = require "core.mappings"

return M
