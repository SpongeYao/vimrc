sudo apt-get install vim 
sudo apt-get install git curl
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp vimrc/vimrc ~/.vimrc
vim +PluginInstall +qall
