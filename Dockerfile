FROM public.ecr.aws/bitnami/golang:1.19.5

WORKDIR /go/src/app

COPY go.mod go.sum ./

RUN go mod download

RUN go get github.com/mattn/go-sqlite3@v1.10.0
RUN go install bitbucket.org/liamstask/goose/cmd/goose@v0.0.0-20150115234039-8488cc47d90c
RUN go install github.com/pilu/fresh@v0.0.0-20190826141211-0fa698148017

COPY . .

CMD ["fresh"]