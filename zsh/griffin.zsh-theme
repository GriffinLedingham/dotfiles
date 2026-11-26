# griffin.zsh-theme (modified version of af-magic theme by andyfleming)

# primary prompt
PROMPT='$FG[141]%n\
$(git_prompt_info)$(hg_prompt_info)\
$FG[039]%~ $FG[253]%(!.#.$)%{$reset_color%} '

# color vars
eval my_gray='$FG[141]'
eval my_orange='$FG[214]'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[168]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075]($FG[168]"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
