# Getting started

### Prerequisites

To use this configuration correctly, you need to install this cli programms
**gcc**, **cmake**, **clang**, **php-cli**, **phpcs**

#### Getting [GCC](https://gcc.gnu.org/install/)

To make sure you do not have any problems using **auto-complete** for C/C++ you will need to install GCC and CMAKE, you will need to
**provide** some information inside the `.emacs` files.

```shell
$ sudo apt-get install -y gcc
```
or

```shell
# yum install gcc
```
[more information here](https://gcc.gnu.org/install/)

#### Geting cmake
```shell
$ sudo apt-get install -y cmake
```
or

```shell
# yum install cmake
```

#### Getting PHP

To use emacs flymake-php linter, you will need to install PHPCS. I'm currently using PSR-2 normes but you can change is it please to you.

If you want to install it manually, may you have a good luck, check it [there](http://php.net/manual/fr/install.php) ^_^

else juste do (I'm using PHP5.6 by the way)

```shell
$ sudo apt-get update && sudo apt-get install -y php5-cli
```
or

```shell
# yum install php5-cli
```

# Good to know

#### Getting powerline fonts

Make sure you change you shell default font to powerline fonts. [Get all of them here](https://github.com/powerline/fonts)

# Basic installation

## Via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Nickael/vim.dotfile/master/install.sh)"
```

## Via wget

```shell
sh -c "$(wget https://raw.githubusercontent.com/Nickael/vim.dotfile/master/install.sh -O -)"
```
<!--
# IMPORTANT

* If you want vim to use ***powerline ***  
-->

# Good luck and enjoy
