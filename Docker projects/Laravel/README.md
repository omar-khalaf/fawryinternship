# Laravel App with Docker Compose
This is a simple guide to set up a Laravel app using Docker Compose. The app uses a MySQL database, Redis, Node.js, and MailHog for email testing.

#Prerequisites

Before proceeding, make sure you have the following installed:

* Docker
* Docker Compose

# Getting Started

1) Clone or download the Laravel app code to your local machine.

2) Create a .env file in the root directory of the app and set the necessary environment variables for your app, including the database credentials and Redis password.

3) Create a docker-compose.yml file in the root directory of your app and copy the contents of the provided file in this repository.

4) In the terminal, navigate to the root directory of your app and run the following command to start the Docker containers:

```
docker-compose up -d
```

This command will start the containers in the background.

# Containers

The following containers are used in this setup:

* php: This container uses the PHP 8.1 image and installs the necessary extensions for Laravel. It also copies the app code into the container and installs the dependencies using Composer. It runs the Laravel server.
* database: This container uses the MySQL 8.0 image and sets up a database for the app. The database credentials and root password are set in the .env file.
* redis: This container uses the Redis image and sets up a Redis server. The Redis password is set in the .env file.
* node: This container uses the Node.js 14-alpine image and installs the necessary dependencies for the app using npm.
* mailhog: This container uses the MailHog image and provides a fake email server for testing.

# Network
In the Laravel app with Docker Compose, there are several containers running in the background, each with its own specific port for communication. Here are the ports used by each container:

* php: This container runs the Laravel application and exposes port 8000 for HTTP traffic. This means that when you navigate to http://localhost:8000 in your browser, you are communicating with the Laravel app through port 8000.

* database: This container runs the MySQL database and exposes port 3306 for MySQL traffic. This port is used for communication between the Laravel app and the database.

* redis: This container runs the Redis server and exposes port 6379 for Redis traffic. This port is used for communication between the Laravel app and the Redis server.

   
* mailhog: This container runs MailHog, a fake email server, and exposes port 8025 for HTTP traffic. This port is used for accessing the MailHog email inbox in your browser.

These ports are specified in the docker-compose.yml file and can be customized according to your needs.
# Conclusion
You can now successfully access your app 🎉🎊🎆🎇👏👍💯🙌🥳🤩 
by entering http://localhost:8025 the above methode to deploy the app using artisan is great development mode in case of deployment it's recommended to use nginx or apache
