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

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      }
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    config = function()
      -- show harpoon quick menu in telescope instead of default viewer
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end
        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end
      require('which-key').setup()
      require('which-key').add {
        {
          '<leader>a',
          function()
            require('harpoon'):list():add()
          end,
          desc = 'Harpoon File',
        },
        {
          '<C-e>',
          function()
            local harpoon = require 'harpoon'
            toggle_telescope(harpoon:list())
          end,
          desc = 'Harpoon Quick Menu',
        },
        {
          '<leader>1',
          function()
            require('harpoon'):list():select(1)
          end,
          desc = 'Harpoon to File [1]',
        },
        {
          '<leader>2',
          function()
            require('harpoon'):list():select(2)
          end,
          desc = 'Harpoon to File [2]',
        },
        {
          '<leader>3',
          function()
            require('harpoon'):list():select(3)
          end,
          desc = 'Harpoon to File [3]',
        },
        {
          '<leader>4',
          function()
            require('harpoon'):list():select(4)
          end,
          desc = 'Harpoon to File [4]',
        },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
