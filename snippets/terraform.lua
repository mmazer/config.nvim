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
  )
}
