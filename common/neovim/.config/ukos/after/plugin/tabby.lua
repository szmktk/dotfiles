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
-- require("tabby.tabline").use_preset("active_wins_at_tail", opts)

-- this is the "active_wins_at_tail" preset but with a small tweak - "NvimTree" buffer is removed
require("tabby.tabline").set(function(line)
  local function no_nvimtree(win)
    return not string.match(win.buf_name(), "NvimTree")
  end

  return {
    {
      { "  ", hl = opts.theme.head },
      line.sep("", opts.theme.head, opts.theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and opts.theme.current_tab or opts.theme.tab
      return {
        line.sep("", hl, opts.theme.fill),
        tab.is_current() and "" or "󰆣",
        tab.number(),
        tab.name(),
        tab.close_btn(""),
        line.sep("", hl, opts.theme.fill),
        hl = hl,
        margin = " ",
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab(), no_nvimtree).foreach(function(win)
      return {
        line.sep("", opts.theme.win, opts.theme.fill),
        win.is_current() and "" or "",
        win.buf_name(),
        line.sep("", opts.theme.win, opts.theme.fill),
        hl = opts.theme.win,
        margin = " ",
      }
    end),
    {
      line.sep("", opts.theme.tail, opts.theme.fill),
      { "  ", hl = opts.theme.tail },
    },
    hl = opts.theme.fill,
  }
end)
