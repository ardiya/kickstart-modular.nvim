local wk = require 'which-key'
wk.add {
  -- Bufferline keymaps
  { '<leader>b', group = '[B]uffers' },
  { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
  { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
  { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
  { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
  { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
  { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
  { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
  { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
  { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
  { '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>' },
  { '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>' },
  { '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>' },
  { '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', hidden = true },
  { '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', hidden = true },
  { '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', hidden = true },
  { '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', hidden = true },
  { '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', hidden = true },
  { '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', hidden = true },
  { '<leader>$', '<Cmd>BufferLineGoToBuffer -1<CR>', desc = 'Buffer-Last' },
  { 'gb', '<Cmd>BufferLinePick<CR>', desc = 'Pick Buffer' },
  -- Window keymaps
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
  -- ToggleTerm keymaps
  { '<C-`>', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
}

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- set space to no-op so it doesn't conflict with leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

return {}
-- vim: ts=2 sts=2 sw=2 et
