local wk = require 'which-key'
wk.add {
  {
    '<leader>b',
    group = '[B]uffers',
    expand = function()
      return require('which-key.extras').expand.buf()
    end,
  },
  {
    '<leader>W',
    group = '[W]indows',
    expand = function()
      local win_list = require('which-key.extras').expand.win()
      local indexed_win_list = {}
      for i = 1, #win_list do
        indexed_win_list[i] = win_list[i - 1] -- Shift the index by -1
      end
      return indexed_win_list
    end,
  },
  -- ctrl+` to <cmd>ToggleTerm
  { '<C-`>', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
}
vim.keymap.set('t', '<C-`>', '<cmd>ToggleTerm<cr>', { desc = 'Toggle Terminal' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- set space to no-op so it doesn't conflict with leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

-- set s to no-op so it doesn't conflict with mini.surround
vim.api.nvim_set_keymap('', 's', '<Nop>', { noremap = true, silent = true })

return {}
-- vim: ts=2 sts=2 sw=2 et
