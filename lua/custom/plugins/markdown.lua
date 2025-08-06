return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require('render-markdown').setup {
      preset = 'obsidian',
      completions = { lsp = { enabled = true }, blink = { enabled = true } },
      code = {
        style = 'full',
        width = 'block',
        language_icon = false,
        language_info = false,
        language_name = false,
      },
      callout = {

        code = { raw = '[!CODE]', rendered = ' Code', highlight = 'RenderMarkdownHint', category = 'custom' },
      },
    }
  end,
}

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'markdown',
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.linebreak = true
--     vim.opt_local.textwidth = 80
--     vim.opt_local.formatoptions:append('tca')
--   end,
-- })
