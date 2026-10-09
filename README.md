# conf.d
Config files for tmux, nvim, vscode etc.

```shell
git clone git@github.com:liromot/conf.d.git
cd conf.d
```

## tmux

Create a config symlink for tmux:

```bash
ln -s `pwd`/tmux ~/.config/tmux
```

## neovim

Create a config symlink for nvim:

```bash
ln -s `pwd`/nvim ~/.config/nvim
```

## vscode

Create a configs symlink for vscode and copy snippets:

```bash
mv ~/.config/Code/User/settings.json ~/.config/Code/User/settings.bak.json && \
ln -s `pwd`/vscode/settings.json ~/.config/Code/User/settings.json

mv ~/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.bak.json && \
ln -s `pwd`/vscode/keybindings.json ~/.config/Code/User/keybindings.json

./vscode/snippets.sh
```
