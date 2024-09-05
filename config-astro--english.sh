#! /usr/bin/env bash
# Version 1.0
# English version
# DEVELOPMENT VERSION

LOGFILE="/tmp/config-astro.log"
echo "You can follow the script's progress from this log file" >> "$LOGFILE" 2>&1

echo ""
echo "This script is delivered free of charge under the MIT license by the free AstroLinux project"
echo "It can be downloaded from the github repository https://github.com/Tom-LAFOND/ASTROLinux"
echo ""
echo -e '\033[0;35m'
echo "                    __________    ____________    __________        __________"
echo "        /\         /          |  |            |  /  _____   \      /          \ "
echo "       /  \        |    ______|  |____    ____| |   /    \   |    /    ____    \ "
echo "      /    \       |   |______       |   |      |   \____/   |   |    /    \    |"
echo "     /      \      |          \      |   |      |    __    _/    |   |      |   |"
echo "    /   /\   \     \______    |      |   |      |   |  \   \     |   |      |   |"
echo "   /   /__\   \     ______|   |      |   |      |   |   \   \    |    \____/    |"
echo "  /   ______   \   |          |      |   |      |   |    \   \    \            /"
echo " /___/      \___\  |_________/       |___|      |___|     \___\    \__________/ "
echo ""
echo "This script will turn your distribution into the perfect research environment! "
echo ""
echo -e '\033[0;31m'
echo "This script is currently only available for debian-based distributions"
echo "(Ubuntu and derivatives, Linux Mint, Mx-Linux, Q4OS, Debian...)"
echo "We strongly advise you to read the documentation before running the script"
echo "Documentation: https:/..."
echo ""
echo "Disk space required to run the script: ~20Go"
echo ""
echo "Instructions:"
echo " - Answer the questions posed by the script by typing 'y' or 'N' and then pressing the 'enter' key."
echo " - Do not stop the script during execution (Estimated time: 35 min)"
echo ""
echo "To follow the script's progress, open a new tab in your terminal and type the command: tail -f /tmp/config-astro.log "
echo ""
echo -e '\033[0;0m'
echo -e '\033[0;35m'
echo -n "Would you like to run the script? (y/N):"
read ask_start
echo -e '\033[0;0m'

if [ "$ask_start" = "n" ] || [ "$ask_start" = "N" ]; then
    echo "Ok, bye! "
    exit
elif [ "$ask_start" = "" ] || [ "$ask_start" = "Y" ] || ["$ask_start"  = "y"; then
	:
fi


# Check which distribution the script is running on
d=($(</etc/os-release)) ;
case "${d[0]##*=}" in
    '"Ubuntu' | '"Debian' | '"Linux' | Lubuntu | Kubuntu | '"MX' ) echo -e '\033[0;32m' ;
    echo "Your distribution is compatible with the script!" ;
    echo -e '\033[0;0m' ;;
    * ) echo -e '\033[0;31m' ;
    echo "Your distribution is not supported by this script!" ;
    echo -e '\033[0;0m' ; sleep 8 ; exit ;;
esac


# System preparation:
sudo apt clean
sudo apt update >> "$LOGFILE" 2>&1
sudo apt list --upgradable



# Make updates available
echo -n "Here's the list of upgradeable packages. Do you want to upgrade? (there may be no upgrade available) y/N "
read maj

case "$maj" in
    yes | YES | Y | y | OUI | oui | O | o ) sudo apt full-upgrade -y >> "$LOGFILE" 2>&1 ;
    echo "Mises à jour terminées ;)";;
    non | n | N | Non | NON | No | NO | no ) echo "Mises à jour annulées";;
esac

echo ""
echo -e '\033[0;31m'
echo "The list of software to be installed is available here: https://..."
echo ""

echo -e '\033[0;35m'
# Request python environment configuration
echo -n "Do you want the script to install and configure a complete development environment on your system? (y/N) "
read ask_devenv

# Scientific software installation request
echo -n "Do you want the script to install/configure a list of astronomy-related scientific software? (y/N) "
read ask_scisoft

# Office software installation request
echo -n "Would you like the script to install some office/data processing software that seems important in science? (y/N)"
read ask_desksoft

# Request for installation of document composition software
echo -n "Do you want the script to install document composition software such as Latex or Markdown (for publications)? (y/N)"
read ask_Docsoft
echo -e '\033[0;0m'


# INSTALLATION DEV ENVIRONMENT:
case "$ask_devenv" in
    yes | YES | Y | y | OUI | oui | O | o ) echo -e '\033[0;35m' ;
    echo " 1/ DEVELOPMENT ENVIRONMENT CONFIGURATION..." ;
    echo -e '\033[0;0m' ;

    # dependencies installation
    echo "dependencies installation..." ;
    sudo apt install -y make build-essential libssl-dev zlib1g-dev >> "$LOGFILE" 2>&1 ;
    sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev >> "$LOGFILE" 2>&1 ;
    sudo apt install -y libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl >> "$LOGFILE" 2>&1 ;
    sudo apt install -y git >> "$LOGFILE" 2>&1 ;

    #installation of pyenv
    echo "Download of pyenv..."
    echo ""
    curl https://pyenv.run | bash >> "$LOGFILE" 2>&1 ;
    echo ""
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" ;
    eval "$(pyenv init -)" ;
    eval "$(pyenv virtualenv-init -)" ;

    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc ;
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc ;
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc ;
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc ;

    # installation of python
    echo "Installation of Python3.12.3..." ;
    pyenv install -v 3.12.3 >> "$LOGFILE" 2>&1 ;

    echo "Creating a virtual environment for python..." ;
    pyenv virtualenv 3.12.3 env-3-12 ;
    source .pyenv/versions/env-3-12/bin/activate ;

    # installing python packages for science
    echo "Installation of python libraries selected for science..." ;
    pip install numpy >> "$LOGFILE" 2>&1 ;
    pip install pandas >> "$LOGFILE" 2>&1 ;
    pip install matplotlib >> "$LOGFILE" 2>&1 ;
    pip install scipy >> "$LOGFILE" 2>&1 ;
    pip install astroml >> "$LOGFILE" 2>&1 ;
    pip install astropy >> "$LOGFILE" 2>&1 ;
    pip install astroquery >> "$LOGFILE" 2>&1 ;
    pip install pyinstaller >> "$LOGFILE" 2>&1 ;
    pip install jupyterlab >> "$LOGFILE" 2>&1 ;
    pip install --upgrade-pip >> "$LOGFILE" 2>&1 ;

    echo "Installation of an IDE..." ;
    sudo apt install -y spyder >> "$LOGFILE" 2>&1 ;

    echo "Python environment configured ;)" ;
    echo "" ;
    echo "" ;;
    non | n | N | Non | NON | No | NO | no ) echo "Development environment configuration CANCELLED";;
esac




# SCIENTIFIC ENVIRONMENT INSTALLATION
case "$ask_scisoft" in
    yes | YES | Y | y | OUI | oui | O | o ) echo -e '\033[0;35m' ;
    echo " 2/ SCIENTIFIC ENVIRONMENT INSTALLATION..." ;
    echo -e '\033[0;0m' ;

    echo "Installation maxima..." ;
    sudo apt install -y maxima >> "$LOGFILE" 2>&1 ;
    sudo apt install -y wxmaxima >> "$LOGFILE" 2>&1 ;

    echo "Installation stellarium..." ;
    sudo apt install -y stellarium >> "$LOGFILE" 2>&1 ;

    echo "Installation labplot..." ;
    sudo apt install -y labplot >> "$LOGFILE" 2>&1 ;
    echo "Installation gnuplot..."
    sudo apt install -y gnuplot >> "$LOGFILE" 2>&1 ;

    echo "Installation aladin..." ;
    sudo apt install -y aladin >> "$LOGFILE" 2>&1 ;
    echo "Installation topcat..."
    sudo apt install -y topcat >> "$LOGFILE" 2>&1 ;

    echo "Installation SOImage ds9..." ;
    sudo apt install -y saods9 >> "$LOGFILE" 2>&1 ;

    echo "Installation skychart..." ;
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B8B57C1AA716FC2 >> "$LOGFILE" 2>&1 ;
    sudo sh -c "echo deb http://www.ap-i.net/apt unstable main > /etc/apt/sources.list.d/skychart.list" >> "$LOGFILE" 2>&1 ;
    sudo apt update >> "$LOGFILE" 2>&1 ;
    sudo apt install -y skychart >> "$LOGFILE" 2>&1 ;
    
    echo "Installation siril..." ;
    sudo apt install -y siril >> "$LOGFILE" 2>&1 ;
    echo "" ;
    echo "Scientific environnement installed ;)" ;
    echo "" ;
    echo "" ;;

	non | n | N | Non | NON | No | NO | no ) echo "Scientific environment installation CANCELLED";;
esac





# THIRD-PARTY SOFTWARE INSTALLATION
case "$ask_desksoft" in
    yes | YES | Y | y | OUI | oui | O | o ) echo -e '\033[0;35m' ;
    echo " 3/ THIRD-PARTY SOFTWARE INSTALLATION..." ;
    echo -e '\033[0;0m' ;
    
    echo "Installation Gnumeric..." ;
    sudo apt install -y gnumeric >> "$LOGFILE" 2>&1 ;

    echo "Installation Gimp..." ;
    sudo apt install -y gimp >> "$LOGFILE" 2>&1 ;
    
    echo "Installation MX Tools..." ;
    sudo apt install -y mx-tools >> "$LOGFILE" 2>&1 ;
    echo "" ;
    echo "Office/maintenance software installed ;)" ;
    echo "" ;
    echo "" ;;

	non | n | N | Non | NON | No | NO | no ) echo "Office software installation/maintenance CANCELLED";;
esac





# INSTALLATION OF DOCUMENT COMPOSITION SOFTWARE
case "$ask_desksoft" in
    yes | YES | Y | y | OUI | oui | O | o ) echo -e '\033[0;35m' ;
    echo " 4/ INSTALLATION OF DOCUMENT COMPOSITION SOFTWARE..." ;
    echo -e '\033[0;0m' ;

    echo "Setting up a LaTex environment..." ;
    sudo apt install -y texlive >> "$LOGFILE" 2>&1 ;
    sudo apt install -y texlive-lang-french >> "$LOGFILE" 2>&1 ;
    sudo apt install -y texstudio >> "$LOGFILE" 2>&1 ;
    
    echo "Setting up a Markdown environment" ;
    sudo apt install -y markdown >> "$LOGFILE" 2>&1 ;
    sudo apt install -y libjs-mathjax >> "$LOGFILE" 2>&1 ;
    sudo apt install -y retext >> "$LOGFILE" 2>&1 ;
    
    echo "" ;
    echo "Document composition environment installed ;)" ;
    echo "" ;;
    
	non | n | N | Non | NON | No | NO | no ) echo "Installation of the document composition environment CANCELLED";;
esac


# FINALIZE CONFIGURATION
echo -e '\033[0;35m'
echo "5/ FINAL CONFIGURATION AND SYSTEM CLEANING..."
echo -e '\033[0;0m'
echo "Creating an alias to activate the python virtual environment..."
echo 'alias virtualenv="source .pyenv/versions/env-3-12/bin/activate"' >> ~/.bashrc ;
sudo apt clean >> "$LOGFILE" 2>&1
sudo apt autoremove -y >> "$LOGFILE" 2>&1
echo ""
echo ""
echo "Your distribution configuration is now complete! ;)"
echo ""
