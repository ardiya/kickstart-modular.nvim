local wk = require("which-key")
wk.add({
  {
    "<leader>b",
    group = "[B]uffers",
    expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    "<leader>w",
    group = "[W]indows",
    expand = function()
      return require("which-key.extras").expand.win()
    end
  },
  -- ctrl+` to <cmd>ToggleTerm
  { "<C-`>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" }
})
vim.keymap.set('t', "<C-`>", "<cmd>ToggleTerm<cr>", { desc = 'Toggle Terminal' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

return {}
-- vim: ts=2 sts=2 sw=2 et
