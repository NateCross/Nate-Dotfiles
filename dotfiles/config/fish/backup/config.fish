if status is-interactive
    # Commands to run in interactive sessions can go here

    ###########
    ### VIM ###
    ###########

    # Set fish to use vim bindings
    fish_vi_key_bindings

    # Make the fish cursor behave properly with vim
    set fish_cursor_default     block      blink
    set fish_cursor_insert      line       blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual      block

    ######################
    ### BEFORE STARTUP ###
    ######################

    # Initialize zoxide
    zoxide init fish | source

    # Display tasks from Taskwarrior
    if type -q task
        task list
    end
end
