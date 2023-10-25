return {
  s("dt", f(function(...)
    return os.date("%Y-%m-%d")
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
