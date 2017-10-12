for file in .tmux.conf .vimrc .gitconfig .zshrc .gvimrc
do
    unlink $HOME/${file}
done
