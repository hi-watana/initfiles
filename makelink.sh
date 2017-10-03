for file in .gvimrc .tmux.conf .vimrc .zshrc
do
	ln -s $PWD/${file} $HOME/${file}
done
