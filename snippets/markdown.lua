local date = require("u.date")
return {
  s("ffm",
    fmt(
      [[
      ---
      title: {1}
      id: {2}
      created: {3}
      modified: {4}
      ---

      # {5}

      {6}
      ]],
      {
        i(1, "title"),
        f(date.timestamp_id),
        f(date.timestamp),
        f(date.timestamp),
        rep(1),
        i(0)
      })
  ),
  s("jth",
    fmt(
      [[
      ### {1}

      {2}
      ]],
      { f(date.time), i(0) }
    )
  ),
  s("jdh",
    fmt(
      [[
      ### {1}

      {2}
      ]],
      { f(date.date), i(0) }
    )
  ),
  s("hl",
    fmt("[{1}]({2})", { i(1, "text"), i(2, "url") })
  ),
  s("todo", fmt("- [] {1}", { i(0) })),
  s("nl", fmt("[[{1}]]", { i(1,"note") })),
  s("agh",
    fmt(
      [[
      # {1}

      {2}
      ]],
      { f(date.date), i(0) }
    )
  ),
}
