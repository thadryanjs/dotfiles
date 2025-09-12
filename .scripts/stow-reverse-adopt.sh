cd ~/.dotfiles
git add . --all
git commit -m "for reverse --adopt"
stow . --adopt
git reset *
