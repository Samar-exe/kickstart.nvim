require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

map("n", "<leader>rm", "<cmd> RenderMarkdown toggle <CR>", { desc = "Toggle Render Markdown" })

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue debugging" })
map("n", "<leader>tr", "<cmd> DapToggleRepl <CR>", { desc = "Toggle Repl" })

map("n", "<leader>md", "<cmd> MarkdownPreview <CR>", { desc = "MarkdownPreview open" })
map("n", "<leader>lv", "<cmd>VimtexView<cr>")
map("n", "<leader>ci", "<cmd> ColorizerAttachToBuffer <cr>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>tt", "<cmd>lua require('base46').toggle_transparency()<cr>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "\\", "<cmd> NvimTreeToggle <cr>")

map({ "n", "t" }, "<F5>", function()
  require("nvchad.term").toggle {
    pos = "sp",
    cmd = function()
      local file = vim.fn.expand "%"

      local ft_cmds = {
        python = "python3 " .. file .. " && exit",
        cpp = "clear && g++ -o out " .. file .. " && ./out",
        java = "java " .. file .. " && exit",
        javascript = "node " .. file .. " && exit",
        tex = "pdflatex " .. file .. " && exit",
        html = "npx live-server",
      }

      return ft_cmds[vim.bo.ft]
    end,
    id = "floatTerm",
  }
end, { desc = "Terminal Toggle Floating term" })
