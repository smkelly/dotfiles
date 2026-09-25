# Color palette to use.
_color_normal='\[\e[0m\]'
_color_gray='\[\e[90m\]'
_color_cyan='\[\e[1;36m\]'
_color_red='\[\e[1;38;2;255;102;102m\]'
_color_orange='\[\e[1;38;2;255;163;71m\]'
_color_yellow='\[\e[1;38;2;255;224;102m\]'
_color_green='\[\e[1;38;2;85;230;133m\]'
_color_blue='\[\e[1;38;2;121;184;255m\]'
_color_purple='\[\e[1;38;2;199;146;234m\]'

_prompt_host_color=$_color_normal
case ${HOSTNAME:0:1} in
  [aAgGmMsSyY]) _prompt_host_color=$_color_red ;;
  [bBhHnNtTzZ]) _prompt_host_color=$_color_orange ;;
  [cCiIoOuU])   _prompt_host_color=$_color_yellow ;;
  [dDjJpPvV])   _prompt_host_color=$_color_green ;;
  [eEkKqQwW])   _prompt_host_color=$_color_blue ;;
  [fFlLrRxX])   _prompt_host_color=$_color_purple ;;
esac

_bash_prompt() {
  # Tests below change $?, so save the command's status first.
  local previous_status=$?
  local prefix='' arrow_color=$_color_green

  if [ "$EUID" -eq 0 ]; then
    prefix="${_color_red}\u"
  elif [ -n "${USER:-}" ] && [ "$USER" != "${LOGNAME:-$USER}" ]; then
    prefix="${_color_yellow}\u"
  fi

  if [ -n "${SSH_CONNECTION:-}${SSH_TTY:-}" ]; then
    if [ -n "$prefix" ]; then
      prefix+="${_color_gray}@"
    fi
    prefix+="${_prompt_host_color}🌐 \h${_color_gray}:"
  elif [ -n "$prefix" ]; then
    prefix+="${_color_gray}:"
  fi

  PS1="${prefix}${_color_cyan}\w${_color_normal}"
  if [ "$previous_status" -ne 0 ]; then
    PS1+=" ${_color_red}[${previous_status}]${_color_normal}"
    arrow_color=$_color_red
  fi
  PS1+=" ${arrow_color}❯ ${_color_normal}"
}

# Only set a fancy prompt if we have a functional terminal.
if [ -t 1 ] && [ -n "${TERM:-}" ] && [ "$TERM" != dumb ]; then
  if [ -n "${ENABLE_STARSHIP_PROMPT:-}" ] && command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
  else
    # Keep promptvars enabled; systemd's PS0 hook uses command substitution.
    PROMPT_COMMAND=_bash_prompt
  fi
fi
