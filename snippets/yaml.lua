return {
  s("fcfp", fmt(
    [[
    - fromFieldPath: {1}
      toFieldPath: {2}
      type: FromCompositeFieldPath
    {3}
    ]],
    { i(1, "from_field"), i(2, "to_field"), i(0) }
  )),
  s("cidr", fmt(
    [[
    - Cidr: "{1}"
      Description: "{2}"
    ]],
    { i(1, "cidr"), i(2, "description") }
  ))
}
