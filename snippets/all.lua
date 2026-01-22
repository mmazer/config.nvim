local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("cmk", { t("✓") }),
  s("dt", f(function(...)
    return os.date("%Y-%m-%d")
  end)),
  s("ts", f(function(...)
    return os.date("%H:%M")
  end)),
  s("dtt", f(function(...)
    return os.date("%Y-%m-%d %H:%M")
  end)),
  s("uts", f(function(...)
    return os.date("!%Y-%m-%dT%H:%M:%S")
  end)),
  s("bp", f(function(...)
    return vim.fn.expand("%:p")
  end)),
  s("vml",
    fmt(
      [[
        # vim: {1} :
        {2}
      ]],
      { i(1, "modeline"), i(0) })
  )
}
