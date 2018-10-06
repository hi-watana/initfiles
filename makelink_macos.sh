for file in .vimrc .ctags
do
	ln -s $PWD/${file} $HOME/${file}
done
for file in .zshrc .gvimrc .tmux.conf
do
	ln -s $PWD/${file}_macos $HOME/${file}
done
