return {
  {
    "lervag/vimtex",
    -- VimTeX configuration goes here, e.g.
    -- latexmk-podman example with official texlive image
    --  echo '#!/bin/bash\n\npodman run --rm --network=none --security-opt=no-new-privileges -v "$(pwd)":/data -w /data "registry.gitlab.com/islandoftex/images/texlive:latest" latexmk "$@"' | tee "$HOME/.local/bin/latexmk" && chmod +x "$HOME/.local/bin/latexmk"
    --  echo '#!/bin/bash\n\npodman run --rm --network=none --security-opt=no-new-privileges -v "$(pwd)":/data -w /data "registry.gitlab.com/islandoftex/images/texlive:latest" bibtex "$@"' | tee "$HOME/.local/bin/bibtex" && chmod +x "$HOME/.local/bin/bibtex"
    --  echo '#!/bin/bash\n\npodman run --rm --network=none --security-opt=no-new-privileges -v "$(pwd)":/data -w /data "registry.gitlab.com/islandoftex/images/texlive:latest" biber "$@"' | tee "$HOME/.local/bin/biber" && chmod +x "$HOME/.local/bin/biber"
    tag = "v2.16",
    config = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-verbose",
          "-shell-escape",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
  },
}
