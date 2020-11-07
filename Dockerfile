FROM mariadb:latest
# Update system packages and install utilities
RUN apt-get update && apt-get install -y vim curl