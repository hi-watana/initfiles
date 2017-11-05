for file in .vimrc .gitconfig .ctags
do
	ln -s $PWD/${file} $HOME/${file}
done
for file in .zshrc .gvimrc .tmux.conf
do
	ln -s $PWD/${file}_linux $HOME/${file}
done
