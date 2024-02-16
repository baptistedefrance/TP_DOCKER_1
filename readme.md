3 -

a - docker pull httpd
b - docker container ls
c - mkdir html, cd html, touch index.html
d - docker run -d -p 80:80 -v /Users/bap/Desktop/B3/TP_DOCKER_1/html:/usr/local/apache2/htdocs/ httpd:latest
e - docker container rm container_id
f - docker run -d -p 80:80 --name apache-server httpd:latest // docker cp /Users/bap/Desktop/B3/TP_DOCKER_1/html/index.html apache-server:/usr/local/apache2/htdocs/index.html

4 -

a -

------------------------------------------------

# Utilise l'image officielle Apache

FROM httpd:latest
 
# Copie le fichier index.html dans le conteneur

COPY ./html/index.html /usr/local/apache2/htdocs/index.html

-------------------------------------------------

docker build -t monserveurweb .


docker run -d -p 80:80 --name mon-serveur-web monserveurweb


Mount Volume:
Avantages:
Les modifications des fichiers sur l'hôte sont immédiatement reflétées dans le conteneur, idéal pour le développement.
Pas besoin de reconstruire l'image pour les modifications de contenu.
Inconvénients:
Moins portable car les volumes dépendent du système hôte.
Peut conduire à des problèmes de permissions entre le conteneur et le système hôte.
Copy dans Dockerfile:
Avantages:
Plus portable, car le contenu est intégré dans l'image et ne dépend pas de l'environnement extérieur.
Sécurité accrue car les fichiers sont encapsulés dans l'image et ne peuvent être modifiés que lors de la reconstruction.
Inconvénients:
Moins flexible pour le développement rapide, car chaque changement nécessite une reconstruction de l'image.
Peut augmenter la taille de l'image si de nombreux fichiers sont copiés.


5 - 

docker network create mon-reseau-db


docker run -d --name ma-base-de-donnees --network mon-reseau-db \                                                        
-e MYSQL_ROOT_PASSWORD=test \
-e MYSQL_DATABASE=test \
-e MYSQL_USER=test \
-e MYSQL_PASSWORD=test \
mysql:latest


docker run --platform linux/amd64 -d --name mon-phpmyadmin --network mon-reseau-db -e PMA_HOST=ma-base-de-donnees -p 8080:80 phpmyadmin/phpmyadmin


a. Docker Compose vs Docker Run
Docker Run est utilisé pour démarrer un conteneur Docker unique. Il est efficace pour l'exécution ou le test d'un conteneur isolé, mais peut devenir complexe et fastidieux lors de la gestion de multiples conteneurs qui partagent des dépendances, des réseaux ou des volumes.

Docker Compose, en revanche, est un outil qui permet de définir et de gérer l'ensemble de l'infrastructure d'une application multi-conteneurs dans un seul fichier YAML. Cela simplifie le processus de configuration des services, des réseaux et des volumes, permettant à l'utilisateur de démarrer, d'arrêter et de reconstruire l'infrastructure avec des commandes simples. Docker Compose est particulièrement utile pour le développement, les tests automatisés, et les environnements de staging ou de production.


docker-compose up


docker-compose down

