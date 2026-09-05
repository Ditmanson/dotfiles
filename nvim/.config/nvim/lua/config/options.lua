vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- 2 spaces, everywhere, no tab characters, no per-filetype overrides.
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- Dracula needs true color to render correctly.
opt.termguicolors = true

-- Spell check on globally; custom words live in the repo so `zg` additions
-- travel with the dotfiles instead of the default data dir.
opt.spell = true
opt.spelllang = "en_us"
opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
