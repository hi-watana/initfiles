for file in .tmux.conf .vimrc .gitconfig .zshrc .gvimrc .ctags
do
    unlink $HOME/${file}
done
