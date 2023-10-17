local date = require("u.date")
return {
  s("ffm",
    fmt(
      [[
      title: {1}
      id: {2}
      created: {3}

      # {4}

      {5}
      ]],
      {
        i(1, "title"),
        f(date.timestamp_id),
        f(date.timestamp),
        rep(1),
        i(0)
      })
  ),
  s("jdt",
    fmt(
      [[
      ### {1}

      {2}
      ]],
      { f(date.date), i(0) }
    )
  ),
  s("hli",
    fmt("[{1}]({2})", { i(1, "text"), i(2, "url") })
  ),
  s("todo", fmt("- [] {1}", { i(0) })),
  s("nli", fmt("[[{1}]]", { i(1,"note") }))
}
