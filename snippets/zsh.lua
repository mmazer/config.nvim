return {
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
   s("plugs",
    fmt(
    [[
    zn-plugin-status $(zn-plugin-name "$0") "{1}"
    ]],
    { i(1, "status") }
    )
  ),
}
