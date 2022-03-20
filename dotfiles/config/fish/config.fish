##############################
##### NATE'S FISH CONFIG #####
##############################

#####################
### ABBREVIATIONS ###
#####################

### Fish's version of aliases
# Use "abbr -a -g <alias name> <command>"

# TODO: Add check if arch distro or not
abbr -a -g add sudo pacman -S
abbr -a -g update sudo pacman -Syu

# Programs I use
abbr -a -g ls exa --icons --grid --header --git --group-directories-first
abbr -a -g lsl exa --icons --grid --header --git -l
abbr -a -g lsm exa --icons --grid --header --git --sort=modified -l

abbr -a -g ra . ranger # Ranger, but if you quit it CDs to dir

abbr -a -g pdf termpdf.py

abbr -a -g open xdg-open

abbr -a -g trash trash-put
abbr -a -g trashl trash-list
abbr -a -g trashr trash-restore
abbr -a -g trashe trash-empty

# Git
abbr -a -g ga git add
abbr -a -g gp git push
abbr -a -g gpl git pull
abbr -a -g gb git branch
abbr -a -g gd git diff
abbr -a -g gco git checkout
abbr -a -g gcl git clone
abbr -a -g gst git status

# Python
abbr -a -g py python
abbr -a -g pyinst python -m pip install

# Neovim
abbr -a -g nv nvim.appimage
abbr -a -g nvim nvim.appimage
abbr -a -g neovim nvim.appimage

# FZF
# abbr -a -g fzfh rg --files --hidden -g "!.git" | "fzf"
abbr -a -g fzfnvim nvim.appimage "(fzf)"
abbr -a -g fzopen xdg-open "(fzf)"

# Web development

# Starts a server to host and test a website at localhost
# others in network can also connect through IP
# Make sure to start in the server directory!
# https://dev.to/fidelve/using-vim-as-your-main-editor-for-web-development-5a73
abbr -a -g browser-sync start --server --files . --no-notify --host $SERVER_IP

# Quick CFG Edits
abbr -a -g cfgnvim $EDITOR ~/.config/nvim/init.lua
abbr -a -g cfgfish $EDITOR ~/.config/fish/config.fish

############
### PATH ###
############
set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/bin
set -x PATH $PATH $HOME/Applications


#################
### VARIABLES ###
#################
set -Ux EDITOR nvim.appimage
set -gx EDITOR nvim.appimage
set -gx VISUAL nvim.appimage

set -x DISABLE_MAGIC_FUNCTIONS true
set -x SERVER_IP hostname -I

set -x SETUPTOOLS_USE_DISTUTILS stdlib

#################
### FUNCTIONS ###
#################


#########################
### INTERACTIVE SHELL ###
#########################

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Disable the welcome greeting upon startup
    set fish_greeting

    # Enable vi mode; use vi bindings in shell
    fish_vi_key_bindings

    # Run zoxide; allows the use of the 'z' command to jump
    zoxide init fish | source
end
