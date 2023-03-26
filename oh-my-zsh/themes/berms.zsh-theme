# Modified from oh-my-zsh jispwoso theme
# https://github.com/ohmyzsh/ohmyzsh/blob/69dfd7758033b3e771dcd184c1b143d166a85481/themes/jispwoso.zsh-theme

# <original license>
# MIT License

# Copyright (c) 2009-2022 Robby Russell and contributors (https://github.com/ohmyzsh/ohmyzsh/contributors)

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# </original license>
# <license of this version>
# MIT License

# Copyright (c) 2022-2023 Henning Janßen

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# </license of this version>

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
