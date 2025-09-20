# Use a lightweight base image like Ubuntu
FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Install the necessary dependencies
RUN apt-get update && apt-get install -y fortune-mod cowsay && rm -rf /var/lib/apt/lists/*

# Copy the wisecow.sh script and make it executable
COPY wisecow.sh .
RUN chmod +x wisecow.sh

# Expose the application port (default is 4499)
EXPOSE 4499

# Run the script when the container starts
CMD ["./wisecow.sh"]
