for file in .tmux.conf .vimrc .zshrc .gvimrc .ctags
do
    unlink $HOME/${file}
done
