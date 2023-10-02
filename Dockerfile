FROM golang:alpine3.18 as build

WORKDIR /src

COPY ./src /src

RUN go build -o /bin/hello ./main.go

FROM scratch

COPY --from=build /bin/hello /bin/hello

ENTRYPOINT [ "/bin/hello" ]