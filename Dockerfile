FROM php:8.1-apache

# Instala dependências do sistema e extensões do PHP necessárias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libzip-dev \
    nodejs \
    npm \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Instala Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Habilita o mod_rewrite do Apache
RUN a2enmod rewrite

# Define diretório de trabalho
WORKDIR /var/www

# Copia os arquivos do projeto
COPY . .

# Instala dependências do projeto
RUN composer install --no-scripts --no-autoloader && \
    composer dump-autoload && \
    npm install && npm run build

# Ajusta permissões de pasta
RUN chown -R www-data:www-data /var/www/storage

# Configura o Apache para apontar para /public
COPY ./apache/app.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
CMD ["apache2-foreground"]
