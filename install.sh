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
repo_vimrc="$REPO/vimrc"
home_vimrc="$HOME/.vimrc"
if [ -e $home_vimrc ];
then
    echo "vimrc already exists"
else
    echo "installing vimrc to $home_vimrc"
    ln -s $repo_vimrc $home_vimrc

    echo "installing vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi


# tmux
repo_tmuxrc="$REPO/tmux.conf"
home_tmuxrc="$HOME/.tmux.conf"
if [ -e $home_tmuxrc ];
then
    echo "tmuxrc already exists"
else
    echo "installing tmuxrc to $home_tmuxrc"
    ln -s $repo_tmuxrc $home_tmuxrc
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
