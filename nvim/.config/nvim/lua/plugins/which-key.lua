return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- No Nerd Font confirmed in this environment — default icon set (mapping
    -- icons AND the special-key glyphs in the popup footer) renders as broken
    -- boxes without one, so replace both with plain text instead.
    icons = {
      mappings = false,
      rules = false,
      keys = {
        Up = "Up ",
        Down = "Down ",
        Left = "Left ",
        Right = "Right ",
        C = "C-",
        M = "M-",
        D = "D-",
        S = "S-",
        CR = "Enter ",
        Esc = "Esc ",
        ScrollWheelDown = "ScrollDown ",
        ScrollWheelUp = "ScrollUp ",
        NL = "Enter ",
        BS = "Backspace ",
        Space = "Space ",
        Tab = "Tab ",
        F1 = "F1",
        F2 = "F2",
        F3 = "F3",
        F4 = "F4",
        F5 = "F5",
        F6 = "F6",
        F7 = "F7",
        F8 = "F8",
        F9 = "F9",
        F10 = "F10",
        F11 = "F11",
        F12 = "F12",
      },
    },
  },
  keys = {
    { "<leader>f", group = "find" },
  },
}
