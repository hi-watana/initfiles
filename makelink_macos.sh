for file in .gvimrc .tmux.conf .vimrc .gitconfig
do
	ln -s $PWD/${file} $HOME/${file}
done
ln -s $PWD/.zshrc_macos $HOME/.zshrc
