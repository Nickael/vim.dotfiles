main() {

  # check if tput is installed if is installed then set coloration

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

  printf "${GREEN}------------------------------------------------\n"
  printf "${BLUE}${BOLD}Installing automated vim config.${NORMAL}\n"
  printf "${GREEN}------------------------------------------------\n"
  printf "${NORMAL}"

  # check if git is installed

  hash git >/dev/null 2>&1 || {
      printf "${RED}Error: ${BOLD}GIT${NORMAL}${RED} is not installed.\nPlease run \`sudo apt install -y git\` to install it.${NORMAL}\n"
        echo "Error: git is not installed\n"
        exit 1
    }

    hash ccze >/dev/null 2>&1 || {
        printf "${RED}Error: ${BOLD}CCZE${NORMAL}${RED} is not installed.\nPlease run \`sudo apt install -y git\` to install it.\n"
            exit 1
        }

  # Cloning remote repository
  CURRENT_DATE=$(date +%Y%m%d_%H%M%S)
  VIMRC=~/.vimrc
  VIM_FOLDER=~/.vim
  VIM_DOT_FOLDER=$HOME/.vim.dotfile
  YCM_FOLDER=$VIM_FOLDER/plugged/YouCompleteMe

  # Check if dotfile already present
  if [ -d "$VIM_DOT_FOLDER" ]; then
      printf "${YELLOW}You already have the dotfile  installed.${NORMAL}\n"
      printf "${YELLOW}Removing old installation folder and backing up previous vim settings.${NORMAL}\n"

      rm -fr $HOME/.vim.dotfile
      exit
  fi

  # Check if any emacs config was already installed
  if [ -d "$VIM_FOLDER" ]; then
      printf "${YELLOW}${BOLD} • Backing up VIM folder.${NORMAL}\n"
      printf "${GREEN}------------------------------------------------${NORMAL}\n"
      tar -czf "$HOME/.vim_$CURRENT_DATE.tar.gz" $VIM_FOLDER
      printf "${GREEN}------------------------------------------------${NORMAL}\n"
      rm -fr $VIM_FOLDER
  fi
  if [ -f "$VIMRC" ]; then
      printf "${YELLOW}${BOLD} • Backing up VIM config file.${NORMAL}\n"
      printf "${GREEN}------------------------------------------------${NORMAL}\n"
      tar -czf "$HOME/.vimrc_$CURRENT_DATE.tar.gz" $VIMRC
      printf "${GREEN}------------------------------------------------${NORMAL}\n"
      printf "${NORMAL}\n"
      rm -fr $VIMRC
  fi

  if [ "$OSTYPE" = cygwin ]; then
      if git --version | grep msysgit > /dev/null; then
          echo "Error: Windows/MSYS Git is not supported on Cygwin"
          echo "Error: Make sure the Cygwin git package is installed and is first on the path"
          exit 1
      fi
  fi
  env git clone --depth=1 https://github.com/Nickael/vim.dotfiles $VIM_DOT_FOLDER || {
      printf "Error: git clone of dofile repo failed\n"
        exit 1
    }

    printf "${GREEN}------------------------------------------------\n"
    printf "${YELLOW}${BOLD} • Cloning new Vim Plug repos before installing plugins${NORMAL}\n"
    printf "${GREEN}------------------------------------------------\n"
    printf "${NORMAL}\n"
    mkdir -v $HOME/.vim
    printf "${NORMAL}\n"
    # git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    # using Plug instead of Vundle as package manager
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

main

cp -fr $VIM_DOT_FOLDER/vimrc $VIMRC
printf "${GREEN}------------------------------------------------\n"
printf "${YELLOW}${BOLD} • Removing temporary cloned dot files folder...${NORMAL}\n"
rm -fr $VIM_DOT_FOLDER
printf "${GREEN}------------------------------------------------\n"
printf "${YELLOW}${BOLD} • Installing Vim pluging now...${NORMAL}\n"
printf "${GREEN}------------------------------------------------${NORMAL}\n"
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa" | ccze -A && echo ' '
echo "${GREEN}------------------------------------------------"
printf "${YELLOW}${BOLD} • Plugin installed\n"
echo "${GREEN}------------------------------------------------${NORMAL}"

if [ -d "$YCM_FOLDER" ]; then
    hash cmake >/dev/null 2>&1 || {
        printf "${RED}Error: ${BOLD}CMAKE${NORMAL}${RED} is not installed.\nPlease run \`sudo apt install -y cmake\` to install it.${NORMAL}\n"
            echo "Error: cmake is not installed\n"
            exit 1
    }

    hash gcc >/dev/null 2>&1 || {
        printf "${RED}Error: ${BOLD}gcc${NORMAL}${RED} is not installed.\nPlease run \`sudo apt install -y gcc\` to install it.${NORMAL}\n"
            echo "Error: gcc is not installed\n"
            exit 1
    }

    hash gpp >/dev/null 2>&1 || {
        printf "${RED}Error: ${BOLD}gpp${NORMAL}${RED} is not installed.\nPlease run \`sudo apt install -y gpp\` to install it.${NORMAL}\n"
            echo "Error: gpp is not installed\n"
            exit 1
    }

    hash g++ >/dev/null 2>&1 || {
        printf "${RED}Error: ${BOLD}g++${NORMAL}${RED} is not installed.\nPlease run \`sudo apt install -y g++\` to install it.${NORMAL}\n"
            echo "Error: g++ is not installed\n"
            exit 1
    }

    printf "${YELLOW}${BOLD} • Building YCM.${NORMAL}\n"
    echo "${GREEN}------------------------------------------------${NORMAL}"
    exec $YCM_FOLDER/install.py --all | ccze -A
    exit
fi
