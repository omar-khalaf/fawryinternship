# Use nginx as the base image
FROM nginx

# Remove the default nginx.conf file
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom nginx.conf file
COPY nginx.conf /etc/nginx/conf.d/

# Copy the static files to the appropriate folder
COPY html /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80
