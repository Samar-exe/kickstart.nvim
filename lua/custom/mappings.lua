require "nvchad.mappings"

-- add yours here
local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue debugging"
    }
  },
}
return M
