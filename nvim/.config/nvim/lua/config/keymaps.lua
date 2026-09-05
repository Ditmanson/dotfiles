-- Snippets aren't a plugin here — just Neovim's built-in `:r !cat <file>`.
-- <leader>html reads snippets/html_boilerplate.html into the buffer at the
-- cursor. To add another snippet: drop a file in snippets/, add a mapping
-- below following the same pattern.
vim.keymap.set(
  "n",
  "<leader>html",
  ":r !cat " .. vim.fn.stdpath("config") .. "/snippets/html_boilerplate.html<CR>",
  { desc = "Insert HTML boilerplate snippet" }
)
