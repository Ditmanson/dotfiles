-- Every default icon in this plugin (headings, checkboxes, callouts, links)
-- is a Nerd Font glyph. No Nerd Font is installed here, so all of them are
-- replaced with plain Unicode/ASCII that renders in any monospace font.
--
-- Callout titles are drawn as an *overlay* directly on top of the raw
-- "[!NOTE]"-style marker text, character for character. A replacement
-- shorter than the marker leaves the marker's trailing characters bleeding
-- through (e.g. "Note" over "[!NOTE]" renders as "NoteE"), so every label
-- is padded with trailing spaces to at least the marker's length.
local function callout(key, label, highlight)
  local raw_len = #key + 3 -- "[!" .. KEY .. "]"
  if #label < raw_len then
    label = label .. string.rep(" ", raw_len - #label)
  end
  return { rendered = label, highlight = highlight }
end

-- Deep-merge keeps every default entry regardless of what's passed for this
-- key, so each known site has to be overridden individually rather than
-- replacing the whole table with `custom = {}`.
local link_sites = {
  "web", "apple", "discord", "github", "gitlab", "google", "hackernews",
  "linkedin", "microsoft", "neovim", "reddit", "slack", "stackoverflow",
  "steam", "twitter", "wikipedia", "x", "youtube", "youtube_short",
}
local link_custom = {}
for _, site in ipairs(link_sites) do
  link_custom[site] = { icon = "-> " }
end

return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<leader>p", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle rendered markdown" },
  },
  opts = {
    heading = {
      icons = { "◆ ", "◇ ", "● ", "○ ", "▪ ", "▫ " },
      signs = { "▎" },
    },
    checkbox = {
      unchecked = { icon = "☐ " },
      checked = { icon = "☑ " },
    },
    code = {
      language_icon = false,
    },
    link = {
      footnote = { icon = "^" },
      image = "[img] ",
      email = "@",
      hyperlink = "-> ",
      wiki = { icon = "" },
      custom = link_custom,
    },
    callout = {
      note = callout("note", "Note", "RenderMarkdownInfo"),
      tip = callout("tip", "Tip", "RenderMarkdownSuccess"),
      important = callout("important", "Important", "RenderMarkdownHint"),
      warning = callout("warning", "Warning", "RenderMarkdownWarn"),
      caution = callout("caution", "Caution", "RenderMarkdownError"),
      abstract = callout("abstract", "Abstract", "RenderMarkdownInfo"),
      summary = callout("summary", "Summary", "RenderMarkdownInfo"),
      tldr = callout("tldr", "Tldr", "RenderMarkdownInfo"),
      info = callout("info", "Info", "RenderMarkdownInfo"),
      todo = callout("todo", "Todo", "RenderMarkdownInfo"),
      hint = callout("hint", "Hint", "RenderMarkdownSuccess"),
      success = callout("success", "Success", "RenderMarkdownSuccess"),
      check = callout("check", "Check", "RenderMarkdownSuccess"),
      done = callout("done", "Done", "RenderMarkdownSuccess"),
      question = callout("question", "Question", "RenderMarkdownWarn"),
      help = callout("help", "Help", "RenderMarkdownWarn"),
      faq = callout("faq", "Faq", "RenderMarkdownWarn"),
      attention = callout("attention", "Attention", "RenderMarkdownWarn"),
      failure = callout("failure", "Failure", "RenderMarkdownError"),
      fail = callout("fail", "Fail", "RenderMarkdownError"),
      missing = callout("missing", "Missing", "RenderMarkdownError"),
      danger = callout("danger", "Danger", "RenderMarkdownError"),
      error = callout("error", "Error", "RenderMarkdownError"),
      bug = callout("bug", "Bug", "RenderMarkdownError"),
      example = callout("example", "Example", "RenderMarkdownHint"),
      quote = callout("quote", "Quote", "RenderMarkdownQuote"),
      cite = callout("cite", "Cite", "RenderMarkdownQuote"),
    },
  },
}
