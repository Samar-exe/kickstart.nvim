return {
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.cmd "let g:mkdp_theme = 'dark'"
      vim.cmd "let g:mkdp_auto_start = 0"
      vim.cmd "let g:mkdp_refresh_slow = 0"
      vim.cmd "let g:mkdp_auto_close = 0"
    end,
  },
  {
    "preservim/vim-markdown",
    dependencies = "godlygeek/tabular",
    ft = { "markdown" },
    config = function()
      vim.cmd "let g:vim_markdown_folding_disabled = 1"
      vim.cmd "let g:vim_markdown_folding_style_pythonic = 1"
      vim.cmd "let g:vim_markdown_new_list_item_indent = 4"
      vim.cmd "let g:vim_markdown_auto_insert_bullets = 0"
      vim.cmd "let g:vim_markdown_borderless_table = 1"
    end,
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local markview = require "markview"
      markview.setup {
        headings = {
          enable = true,
          shift_width = 1,
          heading_1 = {
            style = "icon",
            hl = "MarkviewHeading1",
          },
          heading_2 = {
            style = "icon",
            hl = "MarkviewHeading2",
          },
          heading_3 = {
            style = "icon",
            hl = "MarkviewHeading3",
          },
          heading_4 = {
            style = "icon",
            hl = "MarkviewHeading4",
          },
          heading_5 = {
            style = "icon",
            hl = "MarkviewHeading5",
          },
          heading_6 = {
            style = "icon",
            hl = "MarkviewHeading6",
          },
        },

        code_blocks = {
          style = "language",
          icons = "internal",
          language_direction = "right",
          min_width = 60,
          pad_char = " ",
          pad_amount = 3,

          language_names = {
            ["txt"] = "Text",
            ["cpp"] = "C++",
            ["py"] = "Python",
            ["js"] = "JavaScript",
          },
          hl = "MarkviewCode",
          info_hl = "MarkviewCodeInfo",

          sign = true,
          sign_hl = nil,
        },
        html = {
          enable = true,

          --- Tag renderer for tags that have an
          --- opening & closing tag.
          tags = {
            enable = true,

            --- Default configuration
            default = {
              --- When true, the tag is concealed.
              ---@type boolean
              conceal = false,

              --- Highlight group for the text inside
              --- of the tag
              ---@type string?
              hl = nil,
            },

            --- Configuration for specific tag(s).
            --- The key is the tag and the value is the
            --- used configuration.
            configs = {
              b = { conceal = true, hl = "Bold" },
              u = { conceal = true, hl = "Underlined" },
            },
          },

          --- HTML entity configuration
          entities = {
            enable = true,
            --- Highlight group for the rendered entity.
            ---@type string?
            hl = nil,
          },
        },
      }
    end,
  },

  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   opts = {},
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "echasnovski/mini.nvim",
  --   }, -- if you use the mini.nvim suite
  --   config = function()
  --     local renderMarkdown = require "render-markdown"
  --     renderMarkdown.setup {
  --       heading = {
  --         icons = { " 󰎤 ", " 󰎧 ", " 󰎪 ", " 󰎭 ", " 󰎱 ", " 󰎹 " },
  --         backgrounds = {
  --           "RenderMarkdownH1Bg",
  --           "RenderMarkdownH2Bg",
  --           "RenderMarkdownH3Bg",
  --           "RenderMarkdownH4Bg",
  --           "RenderMarkdownH5Bg",
  --           "RenderMarkdownH6Bg",
  --         },
  --         -- The 'level' is used to index into the array using a clamp
  --         -- Highlight for the heading and sign icons
  --         foregrounds = {
  --           "RenderMarkdownH1",
  --           "RenderMarkdownH2",
  --           "RenderMarkdownH3",
  --           "RenderMarkdownH4",
  --           "RenderMarkdownH5",
  --           "RenderMarkdownH6",
  --         },
  --       },
  --     }
  --     -- Changing links of highlight groups
  --     vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { link = "IncSearch" })
  --     vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { link = "MasonHighlightBlock" })
  --     vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { link = "Substitute" })
  --     vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { link = "Search" })
  --     vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { link = "DiffText" })
  --     vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { link = "OctoBubblePurple" })
  --   end,
  -- },
}
