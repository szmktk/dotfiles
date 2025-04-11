local opts = {
  theme = {
    fill = "TabLineFill",
    head = "TabLine",
    current_tab = "TabLineSel",
    tab = "TabLine",
    win = "TabLine",
    tail = "TabLine",
  },
  nerdfont = true,
  lualine_theme = nil,
  -- tab_name = {
  --     name_fallback = "function({tabid}), return a string",
  -- },
  buf_name = {
    -- unique | relative | tail | shorten
    mode = "unique",
  },
}

-- presets: active_wins_at_tail | active_wins_at_end | tab_with_top_win | active_tab_with_wins | tab_only
require("tabby.tabline").use_preset("active_wins_at_tail", opts)
