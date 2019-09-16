FROM nginx:alpine
# Custom Nginx configuration file
# Add version to the docker image
# Copy a configuration file from the current directory
COPY runner.sh /
ADD nginx.conf /etc/nginx/ 
ADD VERSION .
RUN mkdir /etc/nginx/logs &&  mkdir -p /www/data && chmod +x /runner.sh
COPY index.html /www/data

# Expose port 80 and setup startup script
EXPOSE 80
ENTRYPOINT ["/runner.sh"]

# Set the default command to execute nginx
# when creating a new container
CMD ["nginx", "-g", "daemon off;"]
