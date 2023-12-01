
ZSH_THEME="robbyrussell"
DOT_FILES_DIR="$(dirname "$(readlink -f ~/.zshrc)")"
[[ -f $DOT_FILES_DIR/.zsh/environment-variables.zsh ]] && source $DOT_FILES_DIR/.zsh/environment-variables.zsh && echo "Environment Variables Loaded"
[[ -f $SECRET_ENV_FILE ]] && source $SECRET_ENV_FILE && echo "Secrets env file loaded"
[[ -f $DOT_FILES_DIR/.zsh/aliases.zsh ]] && source $DOT_FILES_DIR/.zsh/aliases.zsh && echo "Aliases loaded"
[[ -f $DOT_FILES_DIR/.zsh/functions.zsh ]] && source $DOT_FILES_DIR/.zsh/functions.zsh && echo "Functions loaded"
[[ -f $DOT_FILES_DIR/.zsh/starship.zsh ]] && source $DOT_FILES_DIR/.zsh/starship.zsh && echo "Starship loaded"
[[ -f $DOT_FILES_DIR/.zsh/nvm.zsh ]] && source $DOT_FILES_DIR/.zsh/nvm.zsh && echo "Nvm loaded"


# Load Starship
eval "$(starship init zsh)"

# Load Direnv
eval "$(direnv hook zsh)"

create_gcp_dir_if_not_exists
create_microsoft_symbolic_link
source_zsh_recursive "$DOT_FILES_DIR/.zsh/functions"
clear_terminal