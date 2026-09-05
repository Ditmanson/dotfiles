-- Parser names (for :install) differ from vim filetypes (for the autocmd
-- below) — markdown_inline is an injected parser, vimdoc's filetype is "help".
local parsers = { "markdown", "markdown_inline", "yaml", "bash", "lua", "vim", "vimdoc" }
local filetypes = { "markdown", "yaml", "bash", "lua", "vim", "help" }

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = function()
    require("nvim-treesitter").install(parsers)
  end,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
