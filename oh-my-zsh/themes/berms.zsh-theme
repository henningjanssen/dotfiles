# Modified from oh-my-zsh jispwoso theme
# https://github.com/ohmyzsh/ohmyzsh/blob/69dfd7758033b3e771dcd184c1b143d166a85481/themes/jispwoso.zsh-theme

ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX=" %{$fg[red]%}↓"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=" %{$fg[green]%}↑"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" [%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="" 

ZSH_THEME_VIRTUALENV_PREFIX=" py:[%{$fg[green]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$fg[blue]%}]%{$reset_color%}"

_theme_reloads() {
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}$(git_commits_ahead)$(git_commits_behind)%{$fg[blue]%}]%{$reset_color%}"
}
add-zsh-hook precmd _theme_reloads
setopt prompt_subst

PROMPT=$'%{$fg[green]%}%n@%m:%{$reset_color%}%{$fg[blue]%}%/%{$reset_color%}%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(virtualenv_prompt_info) % %{$reset_color%}
${ret_status} %{$reset_color%} '

PROMPT2="%{$fg_bold[black]%}%_> %{$reset_color%}"
