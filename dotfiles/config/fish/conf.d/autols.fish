function __autols_hook --description "Auto ls" --on-event fish_prompt
  if test "$NO_AUTO_LS" != ""
    return
  end

  if test "$__autols_last" != (pwd)
    echo; exa --icons --grid --header --git --group-directories-first
  end
  set  -g __autols_last (pwd)
end
