#! /usr/bin/env bash
# Version 1.0
# French version

LOGFILE="/tmp/config-astro.log"
echo "Vous pouvez suivre l'avancement du script depuis ce fichier log" >> "$LOGFILE" 2>&1
echo ""
echo " Ce script est délivré gratuitements sous licence MIT par le projet libre AstroLinux "
echo " Il est téléchargeable depuis le dépôt github https://github.com/Tom-LAFOND/ASTROLinux/tree/main"
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
echo "Ce script va faire de votre distribution l'environnement parfait pour faire de la recherche! "
echo ""
echo -e '\033[0;31m'
echo "Ce script est pour l'instant uniquement disponible pour les distributions basées sur debian"
echo "(Ubuntu et ses dérivées, Linux Mint, Mx-Linux, Q4OS, Debian...)"
echo "Il est fortement conseillé de lire la documentation avant de lancer le script"
echo "Documentation: https:/..."
echo ""
echo "Espace disque nécessaire à l'exécution du script: ~20Go"
echo ""
echo "Instructions:"
echo " - Répondez aux questions posées par le script en tapant 'y' ou 'N' puis en appuyant sur la touche 'entrée'."
echo " - Ne coupez pas le script en cours d'exécution (Temps estimé: 35 min)"
echo ""
echo "Pour suivre les avancées du script, ouvrez un nouvel onglet dans votre terminal et tapez la commande:   tail -f /tmp/config-astro.log "
echo ""
echo -e '\033[0;0m'
echo -e '\033[0;35m'
echo -n "Voulez-vous lancer le script? (y/N):"
read ask_start
echo -e '\033[0;0m'

if [ "$ask_start" = "n" ] || [ "$ask_start" = "N" ]; then
    echo "Ok, bye! "
    exit
elif [ "$ask_start" = "" ] || [ "$ask_start" = "Y" ] || ["$ask_start"  = "y"; then
	:
fi


# Vérifier sur quelle distrib le script est exécuté
d=($(</etc/os-release)) ;
case "${d[0]##*=}" in
    '"Ubuntu' | '"Debian' | '"Linux' | Lubuntu | Kubuntu | '"MX' ) echo -e '\033[0;32m' ;
    echo "Votre distribution est compatible avec le script!" ;
    echo -e '\033[0;0m' ;;
    * ) echo -e '\033[0;31m' ;
    echo "Votre distribution n'est pas supportée par ce script!" ;
    echo -e '\033[0;0m' ; sleep 8 ; exit ;;
esac


# Préparation du système:
sudo apt clean
sudo apt update >> "$LOGFILE" 2>&1
sudo apt list --upgradable



# Faire les maj disponibles
echo -n "Voici la liste des paquets pouvant être mis à jour. Voulez-vous faire la mise à jour? (il est possible qu'il n'y ait aucune mise à jour disponible) y/N "
read maj

case "$maj" in
    yes | YES | Y | y | OUI | oui | O | o ) sudo apt full-upgrade -y >> "$LOGFILE" 2>&1 ;
    echo "Mises à jour terminées ;)";;
    non | n | N | Non | NON | No | NO | no ) echo "Mises à jour annulées";;
esac

echo ""
echo -e '\033[0;31m'
echo "La liste des logiciels qui seront installés est disponible ici: https://..."
echo ""

echo -e '\033[0;35m'
# Demande config environnement python
echo -n "Voulez-vous que le script installe et configure un environnement de développement complet sur votre système? (y/N) "
read ask_devenv

# Demande installation logiciels scientifiques
echo -n "Voulez-vous que le script installe/configure une liste de logiciels scientifiques liés à l'astronomie? (y/N) "
read ask_scisoft

# Demande installation logiciels bureautiques
echo -n "Voulez-vous que le script installe quelques logiciels de bureautique/traitement de données qui semblent importants en science? (y/N)"
read ask_desksoft

# Demande installation logiciels de composition de documents
echo -n "Voulez-vous que le script installe des logiciels de composition de documents tels que Latex ou Markdown (pour les publications)? (y/N)"
read ask_Docsoft
echo -e '\033[0;0m'


# INSTALLATION ENVIRONNEMENT DE DEV:
case "$ask_devenv" in
    yes | YES | Y | y | OUI | oui | O | o ) echo -e '\033[0;35m' ;
    echo " 1/ CONFIGURATION DE L'ENVIRONNEMENT DE DEVELOPPEMENT..." ;
    echo -e '\033[0;0m' ;

    # installation des dépendances
    echo "Installation des dépendances..." ;
    sudo apt install -y make build-essential libssl-dev zlib1g-dev >> "$LOGFILE" 2>&1 ;
    sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev >> "$LOGFILE" 2>&1 ;
    sudo apt install -y libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl >> "$LOGFILE" 2>&1 ;
    sudo apt install -y git >> "$LOGFILE" 2>&1 ;

    #installation de pyenv
    echo "Téléchargement de pyenv..."
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

    # installation python
    echo "Installation de Python3.12.3..." ;
    pyenv install -v 3.12.3 >> "$LOGFILE" 2>&1 ;

    echo "Création d'un environnement virtuel pour python..." ;
    pyenv virtualenv 3.12.3 env-3-12 ;
    source .pyenv/versions/env-3-12/bin/activate ;

    # installation paquets python pour la science
    echo "Installation des bibliothèques python sélectionnées pour la science..." ;
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

    echo "Installation d'un IDE..." ;
    sudo apt install -y spyder >> "$LOGFILE" 2>&1 ;

    echo "Environnement python configuré ;)" ;
    echo "" ;
    echo "" ;;
    non | n | N | Non | NON | No | NO | no ) echo "Configuration de l'environnement de développement ANNULEE";;
esac




# INSTALLATION ENVIRONNEMENT SCIENTIFIQUE
case "$ask_scisoft" in
    yes | YES | Y | y | OUI | oui | O | o ) echo -e '\033[0;35m' ;
    echo " 2/ INSTALLATION DE L'ENVIRONNEMENT SCIENTIFIQUE..." ;
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
    echo "Environnement scientifique installé ;)" ;
    echo "" ;
    echo "" ;;

	non | n | N | Non | NON | No | NO | no ) echo "Installation de l'environnement scientifique ANNULEE";;
esac





# INSTALLATION LOGICIELS DE BUREAUTIQUE
case "$ask_desksoft" in
    yes | YES | Y | y | OUI | oui | O | o ) echo -e '\033[0;35m' ;
    echo " 3/ INSTALLATION DE QUELQUES LOGICIELS DE BUREAUTIQUE..." ;
    echo -e '\033[0;0m' ;
    
    echo "Installation Gnumeric..." ;
    sudo apt install -y gnumeric >> "$LOGFILE" 2>&1 ;

    echo "Installation Gimp..." ;
    sudo apt install -y gimp >> "$LOGFILE" 2>&1 ;
    
    echo "Installation MX Tools..." ;
    sudo apt install -y mx-tools >> "$LOGFILE" 2>&1 ;
    echo "" ;
    echo "Logiciels de bureautique/maintenance installés ;)" ;
    echo "" ;
    echo "" ;;

	non | n | N | Non | NON | No | NO | no ) echo "Installation des logiciels de bureautique/maintenance ANNULEE";;
esac





# INSTALLATION LOGICIELS DE COMPOSITION DE DOCUMENTS
case "$ask_desksoft" in
    yes | YES | Y | y | OUI | oui | O | o ) echo -e '\033[0;35m' ;
    echo " 4/ INSTALLATION DES LOGICIELS DE COMPOSITION DE DOCUMENTS..." ;
    echo -e '\033[0;0m' ;

    echo "Installation d'un environnement LaTex..." ;
    sudo apt install -y texlive >> "$LOGFILE" 2>&1 ;
    sudo apt install -y texlive-lang-french >> "$LOGFILE" 2>&1 ;
    sudo apt install -y texstudio >> "$LOGFILE" 2>&1 ;
    
    echo "Installation d'un environnement Markdown" ;
    sudo apt install -y markdown >> "$LOGFILE" 2>&1 ;
    sudo apt install -y libjs-mathjax >> "$LOGFILE" 2>&1 ;
    sudo apt install -y retext >> "$LOGFILE" 2>&1 ;
    
    echo "" ;
    echo "Environnement de composition de documents installé ;)" ;
    echo "" ;;
    
	non | n | N | Non | NON | No | NO | no ) echo "Installation de l'environnement de composition de documents ANNULEE";;
esac


# FINALISATION DE LA CONFIGURATION
echo -e '\033[0;35m'
echo "5/ CONFIGURATION FINALE ET NETTOYAGE DU SYSTEME..."
echo -e '\033[0;0m'
echo "Création d'un alias pour activer l'environnement virtuel python..."
echo 'alias virtualenv="source .pyenv/versions/env-3-12/bin/activate"' >> ~/.bashrc ;
sudo apt clean >> "$LOGFILE" 2>&1
sudo apt autoremove -y >> "$LOGFILE" 2>&1
echo ""
echo ""
echo "La configuration de votre distribution est terminée! ;)"
echo ""
