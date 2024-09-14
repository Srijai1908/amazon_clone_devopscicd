# Use an official Nginx image as the base image
FROM nginx:alpine

# Copy your static website files to the appropriate directory in Nginx
COPY . /usr/share/nginx/html

# Expose port 80 to access the website
EXPOSE 80

# The command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
