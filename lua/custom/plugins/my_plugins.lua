return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('onedark').setup {
        -- Set a style preset. 'dark' is default.
        style = 'dark', -- dark, darker, cool, deep, warm, warmer, light
      }
      require('onedark').load()
    end,
  },

  -- Codeium
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true })
      vim.keymap.set('i', '<M-[>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true })
      vim.keymap.set('i', '<M-]>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true })
      vim.keymap.set('i', '<C-c>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true })
    end,
  },

  -- toggle terminal
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {},
  },
}

-- vim: ts=2 sts=2 sw=2 et
