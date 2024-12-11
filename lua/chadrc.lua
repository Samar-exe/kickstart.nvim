-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
---
local M = {}

M.base46 = {
  theme = "monochrome",
  transparency = true,

  hl_override = {
    -- Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  hl_add = {
    -- ["MarkviewHeading1"] = { bg = "blue", fg = "black" },
    -- ["MarkviewHeading2"] =  { bg = "blue", fg = "black" },
    -- ["MarkviewHeading3"] =  { bg = "blue", fg = "black" },
    -- ["MarkviewHeading4"] =  { bg = "blue", fg = "black" },
    -- ["MarkviewHeading5"] = { bg = "blue", fg = "black" },
    -- ["MarkviewHeading6"] = { bg = "blue", fg = "black" },
  },
  integrations = {
    "markview"
  },
}

M.ui = {

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = nil,
    modules = nil,
  },

  telescope = { style = "borderless" },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },
}

M.mappings = require "mappings"

M.colorify = {
  enabled = true,
  mode = "bg",
  highlight = { hex = true, lspvars = true },
}

return M
