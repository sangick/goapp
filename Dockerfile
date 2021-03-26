FROM golang:1.11-alpine AS build

MAINTAINER sic,park <sicpark@melong.com>
LABEL "purpose"="Go APP Ser Deployment"

WORKDIR /src/
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
