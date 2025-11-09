FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /server ./cmd

FROM scratch
COPY --from=builder /server /server
EXPOSE 8080
CMD ["/server"]
