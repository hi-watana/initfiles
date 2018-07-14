<<<<<<< HEAD
for file in .tmux.conf .vimrc .ctags
=======
for file in .vimrc .gitconfig .ctags
>>>>>>> 6424cd662c6a969f0f6c82009b1d98c320f5769a
do
	ln -s $PWD/${file} $HOME/${file}
done
for file in .zshrc .gvimrc .tmux.conf
do
	ln -s $PWD/${file}_macos $HOME/${file}
done
