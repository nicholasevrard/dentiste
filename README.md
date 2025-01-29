Installation de WordPress et MariaDB avec Docker Compose
Ce guide explique comment déployer WordPress et MariaDB sur une machine virtuelle (VM) VMware (https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion) nommée "dentiste" en utilisant Docker et Docker Compose.
Prérequis
1.	Docker et Docker Compose doivent être installés sur la machine virtuelle "dentiste". Assurez-vous que ces outils sont correctement installés avant de continuer. Si ce n'est pas déjà fait, vous pouvez suivre les instructions d'installation de Docker et Docker Compose disponibles sur leurs sites officiels (https://docs.docker.com/engine/install/ubuntu/).
2.	VMware : La machine virtuelle "dentiste" doit être fonctionnelle et accessible via le terminal.
3.	Accès à Internet : Un accès à Internet est nécessaire pour télécharger les images Docker de WordPress et MariaDB.
Étapes d'installation
1. Cloner ou copier le fichier docker-compose.yml
Si vous disposez d'un dépôt Git contenant le fichier docker-compose.yml, clonez-le sur la machine "dentiste". Sinon, copiez simplement le fichier docker-compose.yml dans un répertoire approprié sur la machine.
2. Vérifier le fichier docker-compose.yml
Avant de démarrer les services, assurez-vous que le fichier docker-compose.yml contient les bonnes configurations. Ce fichier définit les services nécessaires pour faire fonctionner WordPress et MariaDB ensemble. Il contient des informations comme les paramètres de base de données et les volumes pour stocker les données de votre application.
3. Lancer les services avec Docker Compose
Utilisez Docker Compose pour démarrer les services définis dans le fichier docker-compose.yml. Cela va télécharger les images nécessaires, créer les conteneurs et démarrer WordPress ainsi que MariaDB.
Les services seront lancés en arrière-plan, ce qui signifie que vous n'aurez pas besoin de garder le terminal ouvert.
4. Vérification du déploiement
Une fois les services démarrés, vérifiez qu'ils sont correctement en cours d'exécution. Docker Compose vous permet de vérifier l'état des conteneurs et des services, ainsi que les ports sur lesquels ils sont accessibles.
5. Accéder à WordPress
Après avoir lancé les services, ouvrez un navigateur et accédez à l'adresse de votre machine virtuelle "dentiste", en spécifiant le port sur lequel WordPress est exposé (par défaut, ce sera le port 8080).
Vous devriez voir l'interface d'installation de WordPress. Suivez les instructions pour configurer votre site WordPress, choisir un nom de site, et créer un compte administrateur.
6. Installer l'extension All-in-One WP Migration
Cette extension permet d'importer et d'exporter des thèmes et du contenu WordPress facilement.
1.	Se connecter à WordPress
o	Accédez à l'interface d'administration de WordPress en ajoutant /wp-admin à l'adresse de votre site.
o	Entrez votre identifiant et votre mot de passe administrateur.
2.	Accéder à la gestion des extensions
o	Dans le menu latéral, cliquez sur Extensions, puis sur Ajouter.
3.	Rechercher et installer l'extension
o	Dans la barre de recherche, tapez All-in-One WP Migration.
o	Cliquez sur Installer maintenant, puis sur Activer une fois l'installation terminée.
4.	Utiliser l'extension
o	Un nouvel onglet All-in-One WP Migration apparaît dans le menu de WordPress.
o	Vous pourrez alors importer ou exporter votre site.
7. Importer un thème avec All-in-One WP Migration
Si vous avez un fichier d’export contenant un thème personnalisé, suivez ces étapes :
1.	Aller dans le menu All-in-One WP Migration
o	Cliquez sur Importer.
2.	Importer le fichier
o	Cliquez sur Importer depuis, puis sélectionnez le fichier.wpress contenant votre site.
3.	Démarrer l'importation
o	Attendez que l'importation se termine.
4.	Finaliser l'installation
o	Reconnectez-vous à WordPress si nécessaire et vérifiez que le thème a bien été appliqué.
8. Exporter un site WordPress
Pour sauvegarder votre site ou le transférer vers un autre serveur :
1.	Accéder à l'onglet Exporter
o	Allez dans All-in-One WP Migration, puis cliquez sur Exporter.
2.	Choisir le format d’exportation
o	Cliquez sur Exporter vers, puis choisissez le format souhaité (par défaut, un fichier.wpress).
3.	Télécharger le fichier
o	Une fois l'export terminé, téléchargez le fichier pour l'utiliser ultérieurement.
9. Arrêter les services
Lorsque vous avez terminé avec WordPress, vous pouvez arrêter les services en utilisant Docker Compose. Cela arrêtera les conteneurs et libérera les ressources de votre machine.
Les données de votre site WordPress et de la base de données seront conservées dans des volumes Docker, ce qui permet de les récupérer lors d'un prochain démarrage des services.


