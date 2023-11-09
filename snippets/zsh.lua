return {
  s({trig="pdeps", desc="Zinc plugin dependencies check"},
    fmt(
      [[
      {1}_deps=({2})
      if ! zn-assert-deps ${3}_deps; then
          zn-plugin-status $(zn-plugin-name "$0") "missing one of ${4}_deps"
          return
      fi
      {5}
      ]],
      { i(1, "plugin_name"), i(2, "dependencies"), rep(1), rep(1), i(0) }
    )
  ),
  s("zcmd?",
    fmt(
    [[
    if ! zn-cmd-exists {1}; then
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
  ),
  s("0",
    fmt(
    [[
    0="${{${{ZERO:-${{0:#$ZSH_ARGZERO}}}}:-${{(%):-%N}}}}"
    0="${{${{(M)0:#/*}}:-$PWD/$0}}"
    {1}
    ]],
    { i(0) }
    )
  ),
   s({trig="plugs",desc="Set zinc plugin status"},
    fmt(
    [[
    zn-plugin-status $(zn-plugin-name "$0") "{1}"
    ]],
    { i(1, "status") }
    )
  ),
}
