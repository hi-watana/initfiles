for file in .tmux.conf .vimrc .ctags
do
	ln -s $PWD/${file} $HOME/${file}
done
ln -s $PWD/.zshrc_macos $HOME/.zshrc
ln -s $PWD/.gvimrc_macos $HOME/.gvimrc
