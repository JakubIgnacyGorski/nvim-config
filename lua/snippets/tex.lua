local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
  s("article", {
    t({
      "\\documentclass{article}",
      "",
      "\\usepackage[utf8]{inputenc}",
      "\\usepackage[T1]{fontenc}",
      "\\usepackage{amsmath, amssymb}",
      "",
      "\\title{",
    }),
    i(1, "Title"),
    t({ "}", "\\author{" }),
    i(2, "Author"),
    t({ "}", "\\date{" }),
    i(3, "\\today"),
    t({
      "}",
      "",
      "\\begin{document}",
      "",
      "\\maketitle",
      "",
    }),
    i(4),
    t({
      "",
      "",
      "\\end{document}",
    }),
  }),
})
