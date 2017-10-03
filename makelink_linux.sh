for file in .gvimrc .tmux.conf .vimrc .gitconfig
do
	ln -s $PWD/${file} $HOME/${file}
done
ln -s $PWD/.zshrc_linux $HOME/.zshrc
