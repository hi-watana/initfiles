for file in .tmux.conf .vimrc .gitconfig
do
	ln -s $PWD/${file} $HOME/${file}
done
ln -s $PWD/.zshrc_linux $HOME/.zshrc
ln -s /home/hiroki/initfiles/.gvimrc_linux $HOME/.gvimrc
