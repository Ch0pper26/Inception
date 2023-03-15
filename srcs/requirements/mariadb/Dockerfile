FROM debian:buster

#On install ce dont on a besoin
RUN apt update && apt install mariadb-server mariadb-client -y && rm -rf /var/lib/apt/lists/*

#On donne les ownership au bon groupe et et on donne tous les droit sur le fichier mysql
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

EXPOSE 3306

#On donne les .sh au container et on leur donne les droit d'execution
COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

#On run mariadb et on autorise l'ecoute globale
ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]
CMD ["mysqld", "--bind-address=0.0.0.0"]
