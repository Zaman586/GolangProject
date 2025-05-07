FROM golang:1.20-alpine

WORKDIR /app
COPY . .

RUN go mod init example.com/mymodule
RUN go build -o main .
RUN chmod +x main

EXPOSE 8080
CMD ["./main"]

