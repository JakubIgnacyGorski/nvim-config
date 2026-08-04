local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("all", {
  s("sep", {
    t("# --------------------- "),
    i(1, "section "),
    f(function(args)
      local text = args[1][1]
      local total = 80
      local prefix = "# --------------------- "
      local suffix_len = total - #prefix - #text

      return string.rep("-", math.max(suffix_len, 1))
    end, { 1 }),
  }),
})
