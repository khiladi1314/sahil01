# Dockerized Go Application with Custom Install Script

This project demonstrates how to build a Go application inside a Docker container using a multi-stage build process. It includes a Dockerfile and a custom shell script (`install_go.sh`) for installing a specific version of Go runtime.

---

## Features
- **Custom Go Installation:** Install a specific version of Go using the `install_go.sh` script.
- **Multi-Stage Build:** Efficient Dockerfile design to minimize the final image size.
- **Configurable Binary Name:** Customize the output binary name using a build argument.
- **Port Exposure:** Expose port 8080 for application access.

---



## Prerequisites
- **Docker:** Installed on your system.
- **Go Tar File:** Place the `go*.linux-amd64.tar.gz` file in the same directory as the Dockerfile.

---

## Dockerfile Details
### Build Stage
1. Uses `golang:1.23` as the base image.
2. Copies the Go files and `install_go.sh` script.
3. Executes `install_go.sh` to install Go from a tar file.
4. Builds the Go application into a binary.

### Final Stage
1. Uses a minimal Ubuntu image.
2. Installs Go runtime and application dependencies.
3. Copies the built binary from the builder stage.
4. Exposes port `8080` and runs the application.

---

## Install Script (`install_go.sh`)
This script:
1. Validates the provided directory and Go tar file.
2. Extracts the Go version from the tar file name.
3. Extracts the tar file and renames the directory to include the Go version.

---

## Usage
### Build the Docker Image
Run the following command to build the image:

    docker build -t my-go-app --build-arg OUTPUT_BINARY=my-go-app .

### Run the Docker Container

Execute the built image:

    docker run --rm -p 8080:8080 my-go-app

## Customization
### Change the Output Binary Name
Set the OUTPUT_BINARY argument when building the image:

    docker build -t custom-go-app --build-arg OUTPUT_BINARY=custom-app .

### Use a Different Go Tar File
Replace the go*.linux-amd64.tar.gz file in the project directory with your desired version.

