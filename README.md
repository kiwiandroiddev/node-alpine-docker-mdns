# node-alpine-docker-mdns

Sample mDNS node project for Alpine Linux Docker containers.

See the blog post here: https://coderefinery.wordpress.com/2020/05/29/publishing-your-node-service-with-dns-sd-mdns-from-an-alpine-linux-docker-container/

## Building and Running
To build:
```$bash
$ docker buildx build -t myapp --platform linux/arm/v6 -o type=docker .
```

Run with:
```bash
$ docker run -d --net=host myapp
```