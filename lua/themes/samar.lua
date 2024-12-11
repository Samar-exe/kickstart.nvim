-- credits to original theme https://github.com/chriskempson/base16-vim/blob/master/colors/base16-ashes.vim
-- This is just a modified version of it

local M = {}

M.base_30 = {
  white = "#e4d5c7",
  darker_black = "#040404",
  black = "#040404", -- nvim bg
  black2 = "#2a2a2a",
  one_bg = "#2e2e2e", -- real bg of onedark
  one_bg2 = "#363636",
  one_bg3 = "#3e3e3e",
  grey = "#4e4e4e",
  grey_fg = "#585858",
  grey_fg2 = "#616161",
  light_grey = "#666666",
  red = "#d76b42",
  baby_pink = "#bdcfe5",
  pink = "#aa7900",
  line = "#363636", -- for lines like vertsplit
  green = "#99b52c",
  vibrant_green = "#5da602",
  nord_blue = "#417ab3",
  blue = "#97d7ef",
  yellow = "#ffb670",
  sun = "#aa7900",
  purple = "#e5c499",
  dark_purple = "#e5c499",
  teal = "#bdcfe5",
  orange = "#d76b42",
  cyan = "#bdcfe5",
  statusline_bg = "#2a2a2a",
  lightbg = "#363636",
  pmenu_bg = "#e4d5c7",
  folder_bg = "#e4d5c7",
}

M.base_16 = {
  base00 = "#040404",
  base01 = "#2e2e2e",
  base02 = "#363636",
  base03 = "#5da602",
  base04 = "#dbded8",
  base05 = "#feffff",
  base06 = "#bdcfe5",
  base07 = "#ffffff",
  base08 = "#d76b42",
  base09 = "#aa7900",
  base0A = "#ffb670",
  base0B = "#99b52c",
  base0C = "#bdcfe5",
  base0D = "#97d7ef",
  base0E = "#e5c499",
  base0F = "#d84a33",
}

M.type = "dark"

M = require("base46").override_theme(M, "ashes")

return M
