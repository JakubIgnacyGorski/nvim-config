local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
  s(
    "mdref",
    fmt("[`{}`](#{})", {
      i(1, "reference"),
      f(function(args)
        return args[1][1]
      end, { 1 }),
    })
  ),
})
