FROM golang:1.26-alpine AS builder

WORKDIR /app

# Copy the go.mod and go.sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN go build -o my-app ./server

# Final lightweight stage
FROM alpine:latest

WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/my-app .

# Expose port 8080 (as defined in server/main.go)
EXPOSE 8080

# Command to run the executable
CMD ["./my-app"]
