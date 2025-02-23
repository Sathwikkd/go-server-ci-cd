# First stage: Build the Go application
FROM golang:latest AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum, then download dependencies
COPY go.mod  ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the application as a statically linked binary
RUN go build -o main .

# Second stage: Create a lightweight runtime environment
FROM gcr.io/distroless/base-debian12

# Set the working directory
WORKDIR /app

# Copy the built binary from the first stage
COPY --from=builder /app/main .

# Set the binary as the entrypoint
ENTRYPOINT ["/app/main"]
