# .vim

## Install

```sh
git clone https://github.com/xamfoo/dotvim.git $HOME/.vim
cd $HOME/.vim
git submodule update --init --recursive
```

## Update

```sh
cd $HOME/.vim
git submodule update --recursive
```

## Add plugins

Example:

```sh
cd $HOME/.vim
git submodule add --depth 1 --name unicode.vim --branch master https://github.com/chrisbra/unicode.vim.git ./pack/default/start/unicode.vim
```
