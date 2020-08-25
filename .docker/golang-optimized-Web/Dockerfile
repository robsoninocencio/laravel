FROM golang:alpine AS builder

# Set necessary environmet variables needed for our image
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Move to working directory /build
WORKDIR /build

# Copy and download dependency using go mod
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the code into the container
COPY . .

# Build the application
# RUN go build -o main .
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

# docker build . -t robsoni/golang-optimized-web
# docker run -d -p 3000:3000 robsoni/golang-optimized-web
# Fontes:
# https://levelup.gitconnected.com/complete-guide-to-create-docker-container-for-your-golang-application-80f3fb59a15e#--responses
# https://www.digitalocean.com/community/tutorials/using-ldflags-to-set-version-information-for-go-applications-pt#:~:text=Usando%20ldflags%20com%20o%20go%20build,-Assim%20como%20mencionado
# https://golang.org/cmd/link/
