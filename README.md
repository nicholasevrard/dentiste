# Déploiement de WordPress avec MariaDB via Docker Compose

## Prérequis
Avant de commencer, assurez-vous que votre serveur est prêt à accueillir l'installation de WordPress avec Docker.

### 1. Configuration du serveur
- Un serveur fonctionnel sous Linux (Ubuntu, Debian, CentOS, etc.).
- Un accès administrateur via SSH.
- Une connexion Internet active.

### 2. Installation de Docker et Docker Compose
Si Docker et Docker Compose ne sont pas encore installés sur votre serveur, suivez ces étapes :

#### Méthode 1: Utilise le script bash install-docker.sh

Lancer la commande suivante:
```bash
bash install-docker.sh
```

#### Méthode 2: Suivre la documentation officielle

[Documentation Docker](https://docs.docker.com/engine/install/)

Vérifiez l'installation :
```bash
docker --version
docker compose version
```

**Attention**: la commande docker-compose n'est plus utilisée, veillez à ne pas mettre le tiret.

## Déploiement de WordPress et MariaDB

### 1. Vérifier la configuration de `docker-compose.yml`

Dans le fichier `docker-compose.yml`, vérifier que les configurations sont celles attendues (ports, volumes, etc.)


### 2. Lancer les services
Dans le répertoire où se trouve `docker-compose.yml`, exécutez :

```bash
docker compose up -d
```

Cette commande télécharge les images nécessaires et démarre les conteneurs en arrière-plan.

### 3. Vérification du déploiement
Vérifiez que les conteneurs sont bien en cours d'exécution :
```bash
docker ps
```

### 4. Accéder à WordPress
Attendre quelques minutes pour que les services puissent démarrer.
Ouvrez un navigateur et accédez à `http://<adresse_IP_du_serveur>`.
Vous verrez l'interface d'installation de WordPress. Suivez les étapes pour configurer votre site.

## Installation de l'extension `All-in-One WP Migration and Backup`

Cette extension facilite l'importation et l'exportation des sites WordPress.

### 1. Accéder à l'interface d'administration
- Rendez-vous sur `http://<adresse_IP_du_serveur>/wp-admin`.
- Connectez-vous avec votre compte administrateur.

### 2. Installer l'extension
- Dans le menu latéral, cliquez sur **Extensions** > **Ajouter**.
- Recherchez **All-in-One WP Migration and Backup**.
- Cliquez sur **Installer maintenant**, puis sur **Activer**.

### 3. Importer un thème ou un site
- Allez dans **All-in-One WP Migration and Backup** > **Importer**.
- Sélectionnez votre fichier `.wpress` et lancez l'importation.
- Une fois terminé, reconnectez-vous à WordPress et vérifiez l'apparence du site.

### 4. Dernières étapes
L'importation de cette sauvegarde remplace des éléments de la base de données: 
- Se connecter avec les identifiants par défaut.
- Recréer son utilisateur administrateur.
- Reconfigurer les paramètres de WordPress.
- Recréer l'utilisateur principale et enlever celui qui a été mis par défault.
- Changer le titre du site.

## Arrêt et suppression des services
Si vous souhaitez arrêter WordPress et MariaDB :
```bash
docker compose down
```
Les données seront conservées dans les volumes Docker et pourront être restaurées lors du prochain démarrage.

## Conclusion
Vous avez maintenant un environnement WordPress opérationnel sur votre serveur, avec la possibilité d'importer et d'exporter facilement du contenu grâce à `All-in-One WP Migration and Backup`.

