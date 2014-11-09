alias sc='script/console'
alias sg='script/generate'
alias sd='script/destroy'

alias b="bundle"
alias bi="b install --path vendor/bundle --binstubs vendor/bundle/bin"
# alias bil="bi --local"
alias bu="b update && b package"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/bundle' >> .gitignore"
