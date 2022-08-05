export PS1="\u@\W $ "

alias rs="reset && exec $SHELL"

alias senv="source venv/bin/activate"
alias vpy="senv && python"
alias pipup="pip install --upgrade pip setuptools wheel"
alias reqs="pip install -r dev_requirements.txt"
alias psd="python setup.py develop"
alias dev="$HOME/.pyenv/versions/3.7.8/bin/python -m venv venv && senv && pipup && reqs && psd"

alias gst="git status"
alias gdf="git diff"
alias gfp="git fetch -p && git pull"
alias gpt="git push --follow-tags"


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

