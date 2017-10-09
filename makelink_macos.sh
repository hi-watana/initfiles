for file in .tmux.conf .vimrc .gitconfig
do
	ln -s $PWD/${file} $HOME/${file}
done
ln -s $PWD/.zshrc_macos $HOME/.zshrc
ln -s /home/hiroki/initfiles/.gvimrc_macos $HOME/.gvimrc
