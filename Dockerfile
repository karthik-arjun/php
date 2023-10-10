FROM nginx:latest
RUN apt update -y
RUN apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt update -y
RUN apt install php8.0 -y
RUN apt install -y php8.0-cli php8.0-common php8.0-imap php8.0-redis php8.0-xml php8.0-zip php8.0-mbstring php8.0-fpm

# Create a directory for your PHP application
RUN mkdir -p /var/www/html

# Clone your PHP website from Git
RUN git clone https://github.com/yourusername/your-php-repo.git /var/www/html

# Copy your Nginx configuration file to the container
#COPY nginx.conf /etc/nginx/


# Expose the port Nginx will listen on
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Start PHP-FPM and Nginx
# CMD service php7.4-fpm start && nginx -g 'daemon off;'
