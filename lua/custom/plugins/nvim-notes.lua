return {
  'samar-exe/nvim-notes',
  lazy = false,
  priority = 1000, -- so it runs early
  config = function()
    require('nvim-notes').setup {
      notes_dir = vim.fn.expand '~/notes/',
      default_extension = '.md',
      date_format = '%Y-%m-%d',
      datetime_format = '%Y-%m-%d %H:%M:%S',
      directories = {},
    }

    -- Note management
    vim.keymap.set('n', '<leader>nn', function()
      local date = os.date '%Y-%m-%d'
      vim.ui.input({ prompt = 'Note Name: ' }, function(input)
        if input and input ~= '' then
          -- Sanitize input: replace spaces with hyphens, remove special chars
          local sanitized = input:gsub('%s+', '-'):gsub('[^%w%-_]', '')
          local name = date .. '-' .. sanitized
          vim.cmd('NotesNew ' .. name)
        else
          vim.cmd('NotesNew ' .. date)
        end
      end)
    end, { desc = 'New note' })
    vim.keymap.set('n', '<leader>no', '<cmd>NotesOpen<cr>', { desc = 'Open note' })
    vim.keymap.set('n', '<leader>nf', '<cmd>NotesSearch<cr>', { desc = 'Find in notes' })
    vim.keymap.set('n', '<leader>nd', '<cmd>NotesDaily<cr>', { desc = 'Daily note' })
    vim.keymap.set('n', '<leader>nq', '<cmd>NotesQuick<cr>', { desc = 'Quick note' })
    vim.keymap.set('n', '<leader>nb', '<cmd>NotesBrowse<cr>', { desc = 'Browse notes' })
    vim.keymap.set('n', '<leader>nl', '<cmd>NotesList<cr>', { desc = 'List notes' })
  end,
}
