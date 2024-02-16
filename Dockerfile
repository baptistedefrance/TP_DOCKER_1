# Utilise l'image officielle Apache
FROM httpd:latest

# Copie le fichier index.html dans le conteneur
COPY ./html/index.html /usr/local/apache2/htdocs/index.html

