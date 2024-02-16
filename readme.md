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
