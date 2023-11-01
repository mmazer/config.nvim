return {
  s("zps",
    fmt(
      [[
      {1}_plugin_status="not loaded"

      {2}-plugin-status() {{
          print "${3}_plugin_status"
      }}
      {4}
      ]],
      {
        i(1, "plugin_name"),
        rep(1),
        rep(1),
        i(0)
      })
  ),
  s("zcmd?",
    fmt(
    [[
    if ! zp-cmd-exists {1}; then
        {2}
    fi
    ]],
    { i(1, "cmd"), i(0) }
    )
  ),
  s("param?",
    fmt(
    [[
    local {1}=${{{2}:?"{3}"}}
    {4}
    ]],
    { i(1, "param_name"), i(2, "positional_arg"), i(3, "errmsg"), i(0) }
    )
  )
}
