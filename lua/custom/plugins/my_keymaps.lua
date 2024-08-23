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

return {}
-- vim: ts=2 sts=2 sw=2 et
