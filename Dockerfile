# Use a lightweight Linux distribution as the base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Bash script into the container
COPY wisecow.sh  .

# Install necessary dependencies (cowsay and fortune)
RUN apt update && apt upgrade -y && apt install netcat-openbsd -y && apt install cowsay -y && apt install fortune -y

#Add path for cowsay
ENV PATH=/usr/games:$PATH

# Make the Bash script executable
RUN chmod +x /app/wisecow.sh

# Expose the port on which the server will listen
EXPOSE 4499

# Command to run when the container starts
CMD ["/app/wisecow.sh"]

