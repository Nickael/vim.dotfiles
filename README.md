# Getting started

### Prerequisites

To use this configuration correctly, you need to install this cli programms
**gcc**, 
**cmake**, 
**clang**, 
**python3.6-dev** or depending on your python version

#### Getting [GCC](https://gcc.gnu.org/install/)

To make sure you do not have any problems using **auto-complete** for C/C++ you will need to install GCC and CMAKE, you will need to
**provide** some information inside the `.vimrc` files.

```shell
$ sudo apt-get install -y gcc
```
or

```shell
# yum install gcc
```
[more information here](https://gcc.gnu.org/install/)

#### Getting cmake
```shell
$ sudo apt-get install -y cmake
```
or

```shell
# yum install cmake
```
#### Getting Clang
```shell
$ sudo apt-get install -y clang
```
or

```shell
# yum install clang
```

# Good to know

#### Getting powerline fonts

Make sure you change you shell default font to powerline fonts. [Get all of powerline fonts here](https://github.com/powerline/fonts)
or to nerd fonts. [Get all of nerd fonts here](https://github.com/ryanoasis/nerd-fonts#font-installation)

# Basic installation

## Via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Nickael/vim.dotfiles/master/install.sh)"
```

## Via wget

```shell
sh -c "$(wget https://raw.githubusercontent.com/Nickael/vim.dotfiles/master/install.sh -O -)"
```
<!--
# IMPORTANT

* If you want vim to use ***powerline ***  
-->

## Configure YouCompleteMe
When the installation is done navigate to `~/.vim/bundles/YouCompleteMe`
Then run the command bellow to install YouCompleteMe configuration : 

```shell
./install.py --all
```

# Good luck and enjoy
