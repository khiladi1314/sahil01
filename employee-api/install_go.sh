#!/bin/sh

INSTALL_DIR=$1

# Check if INSTALL_DIR is passed and is a directory
if [ -z "$INSTALL_DIR" ] || [ ! -d "$INSTALL_DIR" ]; then
    echo "Error: Invalid directory provided."
    exit 1
fi

# Find the Go tar file in the given directory
GO_TAR_FILE=$(find "$INSTALL_DIR" -name "go*.linux-amd64.tar.gz" | head -n 1)

# Validate the Go tar file existence
if [ -z "$GO_TAR_FILE" ]; then
    echo "Error: Go tar file not found in $INSTALL_DIR."
    exit 1
fi

# Extract the Go version from the tar file name
GO_VERSION=$(basename "$GO_TAR_FILE" | grep -oP '(?<=go)[0-9]+\.[0-9]+\.[0-9]+')

# Validate the Go version
if [ -z "$GO_VERSION" ]; then
    echo "Error: Unable to extract Go version from $GO_TAR_FILE."
    exit 1
fi

# Print Go version for debugging
echo "Go version: $GO_VERSION"

# Extract the Go tar file
echo "Extracting $GO_TAR_FILE..."
tar -C "$INSTALL_DIR" -xzf "$GO_TAR_FILE"

# Move the extracted Go directory to the proper location
mv "$INSTALL_DIR/go" "$INSTALL_DIR/go-${GO_VERSION}"

# Success message
echo "Go $GO_VERSION successfully installed in $INSTALL_DIR."
