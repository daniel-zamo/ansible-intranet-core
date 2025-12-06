# Partimos de la imagen base oficial
FROM php:8.1-apache

# Instalamos y habilitamos la extensión mysqli
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
