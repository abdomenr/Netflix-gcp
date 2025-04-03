FROM ubuntu:latest

# Update package lists and install Apache2
RUN apt-get update && \
    apt-get install apache2 -y

# Configure Apache2 to listen on port 80
RUN sed -i 's/80/4000/' /etc/apache2/ports.conf

# Copy application files to the web root
COPY . /var/www/html/

# Expose port 80 (container's internal port)
EXPOSE 80

# Start Apache2 in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
