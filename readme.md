a - docker pull httpd
b - docker container ls
c - mkdir html, cd html, touch index.html
d - docker run -d -p 80:80 -v /Users/bap/Desktop/B3/TP_DOCKER_1/html:/usr/local/apache2/htdocs/ httpd:latest

