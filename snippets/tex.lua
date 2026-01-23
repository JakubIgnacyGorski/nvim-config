local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

local function is_line_one()
  return vim.fn.line(".") == 1
end

-- Default LaTeX template
luasnip.add_snippets("tex", {
  s("article", {
    t({
      "\\documentclass{article}",
      "\\usepackage{graphicx}",
      "\\usepackage[utf8]{inputenc}",
      "\\usepackage[T1]{fontenc}",
      "\\usepackage[a4paper, margin=2cm]{geometry}",
      "\\usepackage{polski}",
      "\\usepackage{float}",
      "",
      "% --- Floating objects ---",
      "% \\usepackage{wrapfig}                    % Allows wrapping text around figures.",
      "% \\usepackage{placeins}                   % \\FloatBarrier command to control float placement.",
      "% \\usepackage{subcaption}                 % Subfigures inside figures.",
      "% \\usepackage[inkscapelatex=false]{svg}   % Include SVG graphics.",
      "",
      "% --- Lists ---",
      "% \\usepackage{enumitem}                   % Advanced customization of lists.",
      "",
      "% --- Tables ---",
      "% \\usepackage{longtable}                  % Tables that span multiple pages.",
      "% \\usepackage{array}                      % Additional column formatting options.",
      "% \\usepackage{multirow}                   % Merge multiple rows in a table.",
      "% \\usepackage{tabularx}                   % Tables with adjustable-width columns.",
      "",
      "% --- Symbols & Math ---",
      "% \\usepackage{amsmath}                    % Advanced math formatting.",
      "% \\usepackage{gensymb}                    % Provides symbols like °, ℃.",
      "",
      "% --- Text formatting ---",
      "% \\usepackage{multicol}                   % Multiple columns.",
      "",
      "% --- Code ---",
      "% \\usepackage{minted}                     % Syntax-highlighted code.",
      "",
      "\\renewcommand{\\arraystretch}{1.5}        % Adjusts spacing in tables.",
      "",
      "% ----------------- Hyperlink color setup ---------------------------",
      "\\usepackage{hyperref}",
      "\\hypersetup{",
      "    pdfusetitle,",
      "    colorlinks=true,",
      "    linkcolor=blue,",
      "    urlcolor=blue,",
      "    citecolor=blue",
      "}",
      "",
      "\\title{",
    }),
    i(1, "Title"),
    t({ "}", "\\author{" }),
    i(2, "Author Name"),
    t({
      "}",
      "\\date{\\today}",
      "",
      "\\begin{document}",
      "\\maketitle",
      "",
      "% --------- Disable hyperlink coloring in table of contents ---------",
      "\\begingroup",
      "\\hypersetup{",
      "	linkcolor=black",
      "}",
      "\\tableofcontents",
      "\\endgroup",
      "\\newpage",
      "",
      "",
    }),
    i(3),
    t({ "", "", "\\end{document}" }),
  }, {
    condition = is_line_one, -- Nie rozwijaj, jeśli nie linia 1
    show_condition = is_line_one,
  }),
})

luasnip.add_snippets("tex", {
  s("bibsetup", {
    t({
      "% ------------------------- BibLaTeX setup --------------------------",
      "\\usepackage[utf8]{inputenc}",
      "\\usepackage[",
      "            backend=biber,",
      "            style=numeric",
      "            ]{biblatex} % Biber backend is recommended",
      "\\usepackage[polish]{babel}",
      "\\usepackage{csquotes}",
      "\\addbibresource{",
    }),
    i(1, "bibliography.bib"), -- file name for bibliography
    t({
      "}",
      "\\DefineBibliographyStrings{polish}{",
      "  urlseen = {Dostęp:},",
      "}",
      "% Start URL with new line",
      "\\DeclareFieldFormat{url}{\\newline\\url{#1}}",
      "% Break URL to not go outside paper",
      "\\def\\UrlBreaks{\\do\\/\\do-}",
      "% -------------------------------------------------------------------",
    }),
  }),
})

luasnip.add_snippets("tex", {
  s("PrinterMargins", {
    t({
      "\\usepackage[",
      "  a4paper,",
      "  left=1.5cm,",
      "  right=1.5cm,",
      "  top=1.5cm,",
      "  bottom=2.5cm",
      "]{geometry}",
    }),
  }),
})

luasnip.add_snippets("tex", {
  s("bibend", {
    t({
      "",
      "\\nocite{*}",
      "\\printbibliography",
    }),
  }),
})
