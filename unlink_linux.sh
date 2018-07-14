for file in .tmux.conf .vimrc .gitconfig .zshrc .gvimrc .ctags .Xmodmap
do
    unlink $HOME/${file}
done
