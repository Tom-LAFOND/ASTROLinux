# What is ASTROLinux?

### The idea of ​​the ASTROLinux project is to create a script allowing you to configure a Linux operating system specifically for research in astrophysics/cosmology. This script is therefore primarily aimed at professional researchers and physics students. 
### It is a Bash script which, executed in a terminal, download, install and configure a multitude of selected scientific software.
(See Installation)

![logo-astrolinux](image.png "Le titre de mon image")

## How to use the script?
The script currently only works on distributions based on the Debian distribution

**--> Ubuntu and its derivatives, Linux Mint, MX Linux, Q4OS, Debian**. 

The average running time of the script is 35 min.  
The script requires around 10GB of disk space to install a complete scientific environment.

Once you've freshly installed the linux distribution you want, you can run the script:  
First, download the zipped file from Github. After unzipping it to a folder, open a terminal in the folder (right-click "open terminal here")
then type  
`sudo ./config-astro.sh`

Read the information displayed carefully.
The script begins by listing the updates available for your system, and asks if you wish to perform the updates. If so, type "y" and press "enter". If not, type "N" and press "enter".

The script then asks

- if you want it to set up a python environment for science (see below)
- if you want it to install a list of scientific software (see below)

- If you want it to install some office software (see below)
- If you want it to install a document composition environment (see below)

Then answer with "y" or "N".

We recommend opening a new tab in your terminal and typing `tail -f /tmp/config-astro.log` to follow the program's progress.

Now all you have to do is wait for the script to do its job, without interrupting it :)  
In the event of an error, the error will normally be displayed in the tab in which the script is being run.  
.  


## what does the script actually do?
The script installs and configures a list of packages from the official repositories of your linux distribution.  


### 1 Setting up a python environment
Python is a programming language widely used by researchers, thanks in particular to its ease of use and its many high-level scientific libraries. The script therefore configures the most complete python environment possible for astronomers.  
The script first installs the pyenv utility, using the pyenvinstaller tool, and its dependencies. The script then installs a recent version of the python programming language: version 3.12.3.
After setting up a virtual environment with pyenv, it then installs a number of python libraries for use by scientists: **numpy, matplotlib, astroml, astroquery, pandas, jupyterlab, scipy, astropy **.  
Finally, the script also installs **the Spyder** IDE, a python IDE specialized for science.



### 2. Scientific software installation
The script installs a series of scientific software packages, to cover the needs of astropysicists as far as possible.  
For formal calculation, the script installs Maxima and its graphical interface WxMaxima.  
For data visualization and display, the script installs Labplot and Gnuplot.  
For astronomical image processing, the script installs SAOImage DS9 and Siril.  
For processing and displaying astronomy-specific data, the script installs Aladin and Topcat.  
To visualize the sky and cosmos, the software installs Cartes du Ciel and Stellarium.

### 3. Installation of office software
To meet all the needs of scientists, the script proposes the installation of a number of software packages that are somewhat specific to science: Gnumeric, a spreadsheet and graphing program that can be used for data processing, and Gimp, a photo editing program that can be used to visualize astronomical images.

The script also proposes the installation of MX Tools, system administration tools developed by the MX Linux distribution team. These tools offer a number of interesting features not usually available in Linux distribution settings.

### 4. Document composition software installation
Finally, the script installs a document composition environment, to facilitate the writing of scientific articles and publications.  
The script installs the Latex typesetting system, as well as the Latex TexStudio editor.  
It also installs the Markdown markup language and the ReText editor.

For more information on what the script does, you can read the full documentation here: 

## How to contribute to the project?
If you'd like to help us, the best thing you can do is fill in this online [form](https://forms.gle/nhckhTUMWKaR88mo7). This will help us to better understand the needs of scientists and students in astrophysics, and to identify areas for improvement.  
Of course, you can also review the script code and suggest modifications. Thanks a lot :)

.

---

.





(french version)

# Qu'est-ce que le projet ASTROLinux ?

### L'idée du projet ASTROLinux est de créer un script permettant de configurer un système d'exploitation Linux spécifiquement pour la recherche en astrophysique/cosmologie. Ce script s'adresse donc principalement aux chercheurs professionnels et aux étudiants en physique. 
### Il s'agit d'un script Bash qui, exécuté dans un terminal, télécharge, installe et configure une multitude de logiciels scientifiques sélectionnés.

.  
## Comment utiliser le script?


Le script ne fonctionne pour l'instant que sur les distributions basées sur la distribution Debian

**--> Ubuntu et ses dérivées, Linux Mint, MX Linux, Q4OS, Debian** 

Le temps nécessaire pour l'exécution du script est en moyenne de 35 min.
Le script requiert environ 10Go d'espace disque pour procéder à l'installation d'un environnement scientifique complet.

Premièrement, téléchargez le fichier zippé sur Github. Après l'avoir dézippé dans un dossier, ouvrez un terminal dans le dossier (clic droit "ouvrir un terminal ici")
puis, tapez 
>`sudo ./config-astro.sh`

Lisez attentivement les informations qui s'affichent.
Le script commence par lister les mises à jour disponibles pour votre système et vous demande si vous souhaitez faire les mises à jour. Si c'est le cas, tapez "y" puis appuyez sur "entrée". Sinon, tapez "N".

Le script vous demande ensuite

- Si vous voulez qu'il configure un environnement python pour la science (voir en dessous)
- Si vous voulez qu'il installe une liste de logiciels scientifiques (voir en dessous)

- Si vous voulez qu'il installe quelques logiciels de bureautique (voir en dessous)
- Si vous voulez qu'il installe un environnement de composition de documents (voir en dessous)

Répondez alors par "y" ou "N"

Il est conseillé d'ouvrir un nouvel onglet dans votre terminal et de taper la commande `tail -f /tmp/config-astro.log` pour suivre les avancées du programme.

Il ne reste plus qu'à attendre que le script fasse son affaire, sans l'interrompre :)

En cas d'erreur, l'erreur sera normalement affiché dans l'onglet dans lequel est exécuté le script. 



.  


## Que fait vraiment le script?
Le script installe et configure une liste de paquets à partir des dépôts officiels de votre distribution linux.  


### 1. Configuration d'un environnement python
Python est un langage de programmation très utilisé par les chercheurs, notamment grâce à sa facilité d'utilisation et ses nombreuses bibliothèques scientifiques de haut niveau. Le script configure donc un environnement python le plus complet possible pour les astronomes.  
Le script installe ainsi d'abord l'utilitaire pyenv, grâce à l'outil pyenvinstaller, ainsi que ses dépendances. Le script installe ensuite une version récente du langage de programmation python: la version 3.12.3.
Après avoir configuré un environnement virtuel grâce à pyenv, il installe ensuite de nombreuses bibliothèques python destinées à être utilisées par les scientifique: **numpy, matplotlib, astroml, astroquery, pandas, jupyterlab, scipy, astropy **  
Pour terminer, le script installe aussi **l'IDE Spyder**, un IDE python spécialisé pour la science.


### 2. Installation des logiciels scientifiques
Le script installe une série de logiciels scientifiques, de manière à couvrir autant que possible les besoins des astropysiciens.  
Pour le calcul formel, le script installe le logiciel Maxima ainsi que son interface graphique WxMaxima.  
Pour la visualisation et l'affichage de données, le script install Labplot et Gnuplot.  
Pour le traitement d'images astronomiques, le script installe SAOImage DS9, Siril.  
Pour le traitement et l'affichage de données spécifiques à l'astronomie, le script installe Aladin et Topcat.  
Pour la visualisation du ciel et du cosmos, le logiciel installe Cartes du Ciel et Stellarium.

### 3. Installation de quelques logiciels de bureautiques
Pour remplir tous les besoins des scientifiques, le script propose l'installation de quelques logiciels un peu spécifiques à la science: Gnumeric, un tableur grapheur pouvant être util pour le traitement de données, et Gimp, un logiciel de retouche photo pouvant servir pour visualiser des images astronomiques.

Le script propose aussi l'installation des MX Tools, des outils d'administration du système développés par l'équipe de la distribution MX Linux. Ces outils proposent de nombreuses fonctionnalités intéressantes, qui ne sont généralement pas disponibles dans les paramètres des distributions Linux.

### 4. Installation des logiciels de composition de documents
Le script installe enfin un environnement de composition de documents, afin de faciliter la rédaction d'articles et publications scientifiques.  
Le script installe donc le système de composition Latex, ainsi que l'éditeur Latex TexStudio.  
Il installe aussi le langage de balisage Markdown et l'éditeur ReText.

Pour plus d'informations sur ce que fait le script, vous pouvez lire la documentation complète ici: 

.

## Comment contribuer au projet?
Pour le moment, si vous souhaitez nous aider, le mieux que vous puissiez faire est de remplir ce [questionnaire](https://forms.gle/nhckhTUMWKaR88mo7) en ligne. Cela nous permettra de mieux cerner les besoins des scientifiques et des étudiants en astrophysique, et de voir les points à améliorer.  
Bien sur, vous pouvez aussi relire le code du script et proposer des modifications. Merci à vous :)



