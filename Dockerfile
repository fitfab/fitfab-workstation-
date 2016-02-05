############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM nginx

# File Author / Maintainer
MAINTAINER Miguel Julio

# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y vim curl net-tools

# Uses my local nginx configuration file
ADD ./nginx.conf /etc/nginx/conf.d/default.conf

# Uses my local files
ADD /fitfab /www

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start 
