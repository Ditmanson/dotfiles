-- Keymaps below apply globally once the plugin loads (its own recommended
-- setup), but every Autolist* command checks the current filetype/line and
-- no-ops outside markdown/text list content, so normal <CR>/o/O/dd behavior
-- elsewhere in the editor is unaffected.
return {
  "gaoDean/autolist.nvim",
  ft = { "markdown", "text" },
  config = function()
    require("autolist").setup()

    vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
    vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
    vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
    vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
    vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
    vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
    vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

    vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true, desc = "Cycle list marker forward" })
    vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true, desc = "Cycle list marker back" })

    vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
    vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
    vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
    vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
  end,
}
