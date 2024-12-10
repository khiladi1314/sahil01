# Use the official Golang base image as the builder
FROM golang:1.23 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Go files and the install script into the container
COPY go.mod go.sum ./
COPY . .
COPY install_go.sh /app/

# Make the script executable
RUN chmod +x /app/install_go.sh

# Copy the Go tar file (you need to place it in the same directory as your Dockerfile)
COPY go*.linux-amd64.tar.gz /install_dir/

# Create a directory where the Go tar files will be stored
RUN mkdir -p /install_dir

# Run the install_go.sh script with the /install_dir as an argument
RUN /app/install_go.sh /install_dir

# Build the application (name binary based on module name, or use environment variable)
ARG OUTPUT_BINARY=my-go-app
RUN go build -o $OUTPUT_BINARY .

# Stage 2: Create the final image using Ubuntu
FROM ubuntu:latest

# Install Go runtime in the final image
RUN apt-get update && apt-get install -y golang-go

# Set the working directory in the new container
WORKDIR /app

# Copy the built binary from the builder stage
COPY --from=builder /app/${OUTPUT_BINARY} /app/

# Expose the necessary port (customizable)
EXPOSE 8080

# Run the built binary
CMD ["/app/my-go-app"]
