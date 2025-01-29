local sections = {
  lualine_c = {
    { require("auto-session.lib").current_session_name },
    {
      "filename",
      file_status = true,
      newfile_status = true,
      path = 1,   -- 1: Relative path
    }
  }
}

local inactive_sections = {
  lualine_c = {
    {
      "filename",
      file_status = true,
      newfile_status = true,
      path = 1,   -- 1: Relative path
    }
  }
}

return {
  active = sections,
  inactive = inactive_sections
}
