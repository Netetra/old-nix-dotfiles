set -x FZF_DEFAULT_OPTS "--reverse --border"
set -x FZF_ALT_C_OPTS   "--preview 'tree -C {} | head -200'"
set -x FZF_CTRL_T_OPTS  "--preview 'head -100 {}'"
set -g theme_show_exit_status yes
set -g theme_display_git_ahead_verbose yes
set -g fish_prompt_pwd_dir_length 0

alias hx="helix"
# Python path
fish_add_path $HOME/.local/bin

#if test (tty) = /dev/tty1
#    sway --unsupported-gpu
#end

# pnpm
set -gx PNPM_HOME "/home/netetra/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end