autoload colors && colors

if (( $+commands[git] ))
then
  git=$commands[git]
else
  git=/usr/bin/git
fi
 
git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}
 
git_dirty() {
  st=$($git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ "$st" =~ ^nothing ]]
    then
      echo "%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "%{$fg_bold[cyan]%}$(git_prompt_info) %{$fg[red]%}*%{$reset_color%}"
    fi
  fi
}
 
git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}
 
unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}
 
need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}
 
rb_prompt(){
  if (( $+commands[rbenv] ))
  then
      echo "%{$fg_bold[yellow]%}$(rbenv version | awk '{print $1}')%{$reset_color%}"
    else
      echo ""
  fi
}
 
# This keeps the number of todos always available the right hand side of my
# command line. I filter it to only count those tagged as "+next", so it's more
# of a motivation to clear out the list.
todo(){
  if (( $+commands[todo.sh] ))
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos"
    else
      echo ""
    fi
  else
    echo ""
  fi
}
 
directory_name(){
  echo "%{$fg[white]%}${PWD/#$HOME/~}$reset_color%}"
}
 
PROMPT=$'\n%{$my_gray%}------------------------------------------------------------%{$reset_color%}\n\n$(directory_name) $(git_dirty)$(need_push)$my_purple\n› '
# set_prompt () {
#   export RPROMPT="%{$fg_bold[cyan]%}$(todo)%{$reset_color%}"
# }
 
# precmd() {
#   title "zsh" "%m" "%55<...<%~"
#   set_prompt
# }

# af-magic.zsh-theme
#
# Author: Andy Fleming
# URL: http://andyfleming.com/
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
#
# Created on:   June 19, 2012
# Last modified on: June 20, 2012



# if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
# local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# # primary prompt
# PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
# $FG[032]%~\
# $(git_prompt_info) \
# $FG[105]%(!.#.»)%{$reset_color%} '
# PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
# RPS1='${return_code}'


# # color vars

# # right prompt
RPROMPT='$my_gray%n@%m%{$reset_color%}%'

# # git settings
# ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

