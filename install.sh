main() {
  if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi

  set -e

  umask g-w,o-w

  printf "${BLUE}Cloning vim dotfile${NORMAL}\n"

  # check if git is installed

  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed\n"
    exit 1
  }

  # Check if gcc is installed

  hash gcc >/dev/null 2>&1 || {
    echo "${BOLD}${RED}Error: gcc is not installed${NORMAL}\n"
    exit 1
  }

  # Check if cmake is installed

  hash cmake >/dev/null 2>&1 || {
    echo "${BOLD}${RED}Error: cmake is not installed${NORMAL}\n"
    exit 1
  }

  # Check if clang is installed

  hash clang >/dev/null 2>&1 || {
    echo "${BOLD}${RED}Error: clang is not installed${NORMAL}\n"
    exit 1
  }

  # Cloning remote repository

  if [ "$OSTYPE" = cygwin ]; then
    if git --version | grep msysgit > /dev/null; then
      echo "Error: Windows/MSYS Git is not supported on Cygwin"
      echo "Error: Make sure the Cygwin git package is installed and is first on the path"
      exit 1
    fi
  fi
  env git clone --depth=1 https://github.com/Nickael/vim.dotfiles ~/.vim.dotfile || {
    printf "Error: git clone of dofile repo failed\n"
    exit 1
  }

  # Check if dotfile already present
  if [ -d "~/.vim.dotfile" ]; then
    printf "${YELLOW}You already have the dotfile  installed.${NORMAL}\n"
    printf "You'll need to remove ~/.vim.dotfile if you want to re-install.\n"
    exit
  fi

  # Check if any emacs config was already installed

  if [ -d "~/.vim" ] || [ -h "~/.vimrc"]; then
    read -p "${BLUE}An existing vim configuration already exist do you want to continue ?\n y or n" yn
    if [$yn != "y"]; then
      exit 1
    fi
    printf "${YELLOW}${BOLD}Moving old configuration !${NORMAL}\n"
    mv ~/.vim ~/.vim.bak
    mv -f ~/.vimrc.d ~/.vimrc.d.bak
  fi

  printf "${YELLOW}${BOLD}Cloning new VundleVim repos before installing plugins${NORMAL}\n"
  mkdir -v $HOME/.vim $HOME/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  printf "Launching emacs : "
  for i in {5..1}; do
    printf "."
    sleep 1
  done


}

main

cp -fr ~/.vim.dotfile/vimrc ~/.vimrc

rm -frv ~/.vim.dotfile

echo -e 'Would you like to auto-install vim plugins ? y or n then presse [ENTER]'
read choice

if [ "$choice" = "y" ]; then
  # vim +PluginInstall +qall
  vim +PluginInstall +qall &>/dev/null
else
  echo 'Thanks for using my configuration do not forget to contribut\n if you think you can add more features to it\n make a pull request'
  exit 1
fi
