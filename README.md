# Déploiement de WordPress avec MariaDB via Docker Compose

## Prérequis
Avant de commencer, assurez-vous que votre serveur est prêt à accueillir l'installation de WordPress avec Docker.

### 1. Configuration du serveur
- Un serveur fonctionnel sous Linux (Ubuntu, Debian, CentOS, etc.).
- Un accès administrateur via SSH.
- Une connexion Internet active.

### 2. Lancer le script d'installation

```bash
bash install-docker.sh
```

Si présents sur la machine, désinstalle les versions de Docker qui ne sont pas officielles.
Si absents sur la machine, installe Docker et Docker Compose
Lance le fichier docker-compose.yml, qui créé deux containers l'un contenant WordPress et l'autre MariaDB.
Si absent sur le volume de WordPress, télécharge et installe `All-in-One WP Migration and Backup`.

### 3. Accéder à WordPress
Attendre quelques minutes pour que les services puissent démarrer.
Ouvrez un navigateur et accédez à `http://<adresse_IP_du_serveur>`.
Vous verrez l'interface d'installation de WordPress.
Suivez les étapes pour configurer votre site.

## Installation de l'extension `All-in-One WP Migration and Backup`

Cette extension facilite l'importation et l'exportation des sites WordPress.

### 1. Activer l'extension
- Dans extensions, cliquez sur **Activer**.

### 2. Importer le site template
- Allez dans **All-in-One WP Migration and Backup** > **Importer**.
- Sélectionnez le fichier `.wpress` et lancez l'importation.
- Une fois terminé, se connecter avec les identifiants par défaut et vérifier l'apparence du site.

```yml
id: admin
pw: linux
```

### 3. Dernières étapes
L'importation de cette sauvegarde remplace des éléments de la base de données, il faut donc:
- Recréer un utilisateur administrateur, se connecter dessus et supprimer l'utilisateur par défault.
- Reconfigurer les paramètres de WordPress (titre du site, adresse, etc.)

## Arrêt et suppression des services
Si vous souhaitez arrêter WordPress et MariaDB:

```bash
docker compose down
```
Les données seront conservées dans les volumes Docker et pourront être restaurées lors du prochain démarrage.

Vous pouvez supprimer les volumes en faisant.
```bash
sudo rm -rf db_data wordpress_data
```

## Conclusion
Vous avez maintenant un environnement WordPress opérationnel sur votre serveur, avec la possibilité d'importer et d'exporter facilement du contenu grâce à `All-in-One WP Migration and Backup`.# dentist4
