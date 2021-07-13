# Jekyll container based on Ubuntu

Simple container that ships Ubuntu with Jekyll installed.

## To use this container

1. Create a `Dockerfile` based on this image alongside your jekyll website. In this example the Jekyll website is localed in `./web` on the host system.

```dockerfile
FROM enclavenetworks/jekyll:latest

# copy Jekyll website from ./web into the container
COPY web .

# run bundle install and then clear the directory
RUN bundle install && \
    rm -rf $WEB_DIR

ENTRYPOINT ["/usr/local/bin/bundle"]
CMD [ "exec", "jekyll serve --host 0.0.0.0 --port 8080" ]
```

2. Build and run the container

```bash
#!/bin/sh

docker build -t jekyll .
docker run --rm -it -p 8080:8080 -v ${PWD}/web:/home jekyll
```
