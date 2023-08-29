FROM  golang:1.17-alpine3.15 as builder
WORKDIR /workspaces/fc_docker_go
COPY ./go .
RUN  go build fc_go.go 

FROM scratch
WORKDIR /workspaces/fc_docker_go
COPY --from=builder /workspaces/fc_docker_go .
CMD [ "./fc_go" ]