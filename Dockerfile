# Basis image fra https://hub.docker.com/u/rocker/
FROM rocker/shiny:latest

# Opret nødvendige directories
RUN mkdir /root/app
RUN mkdir /root/app/www

# Kopier filer
COPY R /root/shiny_save
COPY R/www /root/shiny_save/www

# Sæt working directory
WORKDIR /root/shiny_save

# Åben port
EXPOSE 8080

# Kør applikationen ved container start
CMD ["R", "-e", "shiny::runApp('.', host = '0.0.0.0', port = 8080)"]