FROM debian:buster

#On installe nginx et openssl
RUN	apt-get update && \
	apt-get install -y nginx openssl

#On cree un fichier ssl pour les cles de chiffrement
RUN	mkdir /etc/nginx/ssl

#On cree les cles de chiffrement
RUN	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-keyout /etc/nginx/ssl/eblondee.key \
	-out /etc/nginx/ssl/eblondee.crt \
	-subj "/C=FR/ST=Angouleme/L=Angouleme/O=42/OU=eblondee/CN=eblondee.42.fr/"

#On copy la config du serveur dans le dossier nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d

#On cree le ficheir run qui permettera au serveur de se lancer
RUN mkdir -p /run/nginx

#On autorise uniquement le port 443 
EXPOSE	443

#On lance le serveur
CMD [ "nginx", "-g", "daemon off;"]
