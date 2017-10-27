sudo apt-get install vim 
sudo apt-get install git curl
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
sudo mkdir ~/.vim/colors
sudo cp diablo3.vim ~/.vim/colors
sudo cp vimrc ~/.vimrc 
vim +PluginInstall +qall

sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
sudo ./install.py
