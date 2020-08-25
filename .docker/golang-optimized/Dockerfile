FROM golang:alpine AS builder

# Set necessary environmet variables needed for our image
ENV GOOS=linux \
    GOARCH=amd64

# Move to working directory /build
WORKDIR /build

# Copy the code into the container
COPY . .

# Build the application
RUN go build -o main .
RUN go build -ldflags="-w -s" -o main .

# Move to /dist directory as the place for resulting binary folder
WORKDIR /dist

# Copy binary from build to main folder
RUN cp /build/main .

# Build a small image
FROM scratch

COPY --from=builder /dist/main /

# Command to run
ENTRYPOINT ["/main"]

# docker build . -t robsoni/codeeducation
# docker run robsoni/codeeducation
# docker push robsoni/codeeducation
