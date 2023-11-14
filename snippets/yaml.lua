return {
  s("fcfp",fmt(
    [[
    - fromFieldPath: {1}
      toFieldPath: {2}
      type: FromCompositeFieldPath
    {3}
    ]],
    { i(1, "from_field"), i(2, "to_field"), i(0) }
  ))
}
