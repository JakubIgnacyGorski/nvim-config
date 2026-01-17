return {
  {
    "lervag/vimtex",
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_compiler_latexmk = {
        -- latexmk-podman example with official texlive image
        --  echo '#!/bin/bash\n\npodman run --rm --network=none --security-opt=no-new-privileges -v "$(pwd)":/data -w /data "registry.gitlab.com/islandoftex/images/texlive:latest" latexmk "$@"' | sudo tee /usr/bin/latexmk-podman && sudo chmod +x /usr/bin/latexmk-podman
        executable = "latexmk-podman",
      }
    end,
  },
}
