set -e


REPO="$HOME/.dotfiles"
if [ ! -e $REPO ];
then
    echo "git clone git@github.com:c0lon/dotfiles.git"
    exit 1
fi;


RCFILE_TARGET="$HOME/.bashrc"


# install
# TODO: support mac?
sudo apt-get install -y vim tmux git


# vimrc
vimrc_path="$REPO/vimrc"
vimrc_target="$HOME/.vimrc"
if [ -e $vimrc_target ];
then
    echo "vimrc already exists"
else
    echo "installing vimrc to $vimrc_target"
    ln -s $vimrc_path $vimrc_target
fi


# tmux
tmuxrc_path="$REPO/tmuxrc"
tmuxrc_target="$HOME/.tmuxrc"
if [ -e $tmuxrc_target ];
then
    echo "tmuxrc already exists"
else
    echo "installing tmuxrc to $tmuxrc_target"
    ln -s $tmuxrc_path $tmuxrc_target
fi


# pyenv
if [ -e "$HOME/.pyenv" ];
then
    echo "pyenv already installed"
else
    echo "installing pyenv"
    sudo apt-get install git python3-pip make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl
    sudo pip install virtualenvwrapper

    git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
    git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git $HOME/.pyenv/plugins/pyenv-virtualenvwrapper

    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $RCFILE_TARGET
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $RCFILE_TARGET
    echo 'eval "$(pyenv init -)"' >> $RCFILE_TARGET
    echo 'pyenv virtualenvwrapper' >> $RCFILE_TARGET
fi
