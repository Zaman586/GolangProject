# Use the official Golang image with Alpine
FROM golang:1.20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod file first, then download dependencies
# This allows Docker to cache the dependencies layer
COPY go.mod ./
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the application binary
RUN go build -o main .

# Ensure the binary is executable
RUN chmod +x main

# Expose port 8080 for the application
EXPOSE 8080

# Specify the command to run the application
CMD ["./main"]
