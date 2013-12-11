# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jean" #gallifrey

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler mercurial npm rbenv)

source $ZSH/oh-my-zsh.sh

# Disable autocorrect. Is way too annoying for node_module binaries.
unsetopt correct_all

if [ ! "$BOXEN_INSTALLED" ]; then
    # Obtain the Boxen environment, including nvm.
    source /opt/boxen/env.sh
    source /opt/boxen/nvm/nvm.sh
    export BOXEN_INSTALLED=true
fi

# Fix for Boxen.
export CXXFLAGS=$CFLAGS

# Obtain the Ruby environment.
export RBENV_ROOT=/opt/boxen/homebrew/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Obtain the Python environment.
export PYTHONPATH=/opt/boxen/homebrew/lib/python2.7/site-packages:$PYTHONPATH

# Never use the Mac builtin vi.
alias vi=vim

# Game binaries.
export PATH="$PATH:/usr/games/bin"

# Manpages settings.
export MANWIDTH=100

# Get Ninja autocompletion.
_ninja() {
  reply=(`(ninja -t targets all 2&>/dev/null) | awk -F: '{print $1}'`)
}
compctl -K _ninja ninja

# Warn about node version.
echo "Welcome back! Don't forget to set node.js version with nvm."
echo "Current is:" $(node -v)
