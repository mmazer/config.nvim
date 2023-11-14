return {
  s("km",fmt(
    [[
    vim.keymap.set({{"{1}"}}, "{2}", {3})
    ]],
    { i(1, "mod"), i(2, "keys"), i(3, "rhs") }
  )),
  s("vks",fmt(
    [[
    vim.keymap.set({1}
    ]],
    { i(0)}
  )),
  s("kms",fmt(
    [[
    vim.keymap.set({{"{1}"}}, "{2}", {3}, {{silent=true}})
    ]],
    { i(1, "mod"), i(2, "keys"), i(3, "rhs") }
  )),
  s("nkm",fmt(
    [[
    vim.keymap.set({{"n"}}, "{1}", {2})
    ]],
    { i(1, "keys"), i(2, "rhs") }
  )),
  s("nkms",fmt(
    [[
    vim.keymap.set({{"n"}}, "{1}", {2}), {{silent=true}})
    ]],
    { i(1, "keys"), i(2, "rhs") }
  ))
}
