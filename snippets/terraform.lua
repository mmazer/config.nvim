return {
  s("tfv",
    fmt(
      [[
      variable "{1}" {{
        type = {2}
        description = "{3}"
        default = {4}
      }}
      ]],
      {
        i(1, "name"),
        i(2, "type"),
        i(3, "description"),
        i(4, "default"),
      })
  ),
  s("tfm",
    fmt(
      [[
      moved {{
        from = {1}
        to   = {2}
      }}
      ]],
      {
        i(1, "from"),
        i(2, "to")
      })
  )
}
