# install required packages
pkgs="git tmux vim zsh wget python-dev libsm6 libxext6 libxrender-dev"
pips="progressbar ptpython pudb scipy numpy scikit-learn opencv-python"

echo "Installing core packages."
for i in $pkgs; do
    apt-get install -y $i
done

echo "Installing pips."
for i in $pips; do
    pip install --upgrade $i
done

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# installing vim plugins
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/epeli/slimux.git

# get some sane defaults
echo "Grabbing sane defaults"
cd ~
git clone https://github.com/msollami/dotfiles.git
echo "Installing sane defaults"
cd dotfiles
./install.sh

# switch shell to zsh
echo "switching to zsh"
chsh -s $(which zsh)

