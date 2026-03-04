return {
  {
    "lervag/vimtex",
    -- VimTeX configuration goes here, e.g.
    -- latexmk-podman example with official texlive image
    --  echo '#!/bin/bash\n\npodman run --rm --network=none --security-opt=no-new-privileges -v "$(pwd)":/data -w /data "registry.gitlab.com/islandoftex/images/texlive:latest" latexmk "$@"' | tee "$HOME/.local/bin/latexmk" && chmod +x "$HOME/.local/bin/latexmk"
    --  echo '#!/bin/bash\n\npodman run --rm --network=none --security-opt=no-new-privileges -v "$(pwd)":/data -w /data "registry.gitlab.com/islandoftex/images/texlive:latest" bibtex "$@"' | tee "$HOME/.local/bin/bibtex" && chmod +x "$HOME/.local/bin/bibtex"
    --  echo '#!/bin/bash\n\npodman run --rm --network=none --security-opt=no-new-privileges -v "$(pwd)":/data -w /data "registry.gitlab.com/islandoftex/images/texlive:latest" biber "$@"' | tee "$HOME/.local/bin/biber" && chmod +x "$HOME/.local/bin/biber"
  },
}
