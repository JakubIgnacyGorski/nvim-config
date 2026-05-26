local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node

local hdr = s("hdr", {
  t({ "/**", " * @file " }),
  f(function()
    return vim.fn.expand("%:t")
  end, {}),
  t({ "", " * @author " }),
  i(1, "Your Name"),
  t({ "", " * @brief " }),
  i(2, ""),
  t({ "", " * @date " }),
  f(function()
    return os.date("%Y-%m-%d")
  end, {}),
  t({ "", " */", "" }),
})

ls.add_snippets("c", { hdr })
ls.add_snippets("cpp", { hdr })
ls.add_snippets("h", { hdr })
