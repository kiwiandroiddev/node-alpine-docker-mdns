# node-alpine-docker-mdns

Sample node_mdns project for Alpine Linux Docker containers.

See the blog post here: 

Build image with:
```$bash
$ docker buildx build -t myapp --platform linux/arm/v6 -o type=docker .
```

Run with:
```bash
$ docker run -d --net=host myapp
```