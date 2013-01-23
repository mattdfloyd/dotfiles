# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -AF --color"
  alias l="gls -AF --color"
  alias ll="gls -l --color"
  alias la='gls -lAFh --color'
fi
