PROMPT_SYMBOL='\u279C'

# Set default path to plugin if there is no variable with that name
if [ -z "$THEME_PATH" ]; then
THEME_PATH='$HOME/pustelto'
fi

source $THEME_PATH/libs/helpers.zsh

function prompt_generator() {
  left=$(host)$(dirpath)$(git_prompt_info)

  echo "
$left${(l,COLUMNS-${#${(%)left}},)${firebase}}
$(return_code)"
}

function right_prompt_generator() {
  echo "$(firebase)
"
}


function setup() {
  # # This variable is a magic variable used when loading themes with zsh's prompt
  # # function. It will ensure the proper prompt options are set.
  prompt_opts=(cr percent sp subst)

  # # Borrowed from promptinit, sets the prompt options in case the prompt was not
  # # initialized via promptinit.
  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  PROMPT='$(prompt_generator)'
  # RPROMPT='$(right_prompt_generator)'
}

setup
