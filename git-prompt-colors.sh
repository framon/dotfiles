override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"
  GIT_PROMPT_SEPARATOR=" "
  GIT_PROMPT_STAGED="${Green}…"
  GIT_PROMPT_CONFLICTS="${Yellow}✘"
  GIT_PROMPT_CHANGED="${Red}Δ"
  GIT_PROMPT_UNTRACKED="${Cyan}∃"
  GIT_PROMPT_STASHED="${BoldBlack}?"
  GIT_PROMPT_SYMBOLS_AHEAD="↑"
  GIT_PROMPT_SYMBOLS_BEHIND="↓"
  GIT_PROMPT_END_USER=" ${ResetColor} $ "
  GIT_PROMPT_END_ROOT=" ${ResetColor} # "
}

reload_git_prompt_colors "Custom"
