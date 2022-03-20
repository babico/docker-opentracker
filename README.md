# docker-opentracker

Dockerfile for [opentracker](http://erdgeist.org/arts/software/opentracker/) by erdgeist.
I added `DWANT_COMPRESSION_GZIP`, `DWANT_FULLLOG_NETWORKS` properties of opentracker you can it [here](http://erdgeist.org/arts/software/opentracker/#build-instructions)

## DOWNLOAD FILES

```bash
git clone https://github.com/babico/docker-opentracker.git
cd docker-opentracker
```

## EDIT

Edit your local ip address and port at `Dockerfile` and `opentracker.conf`.

## INSTALL

```bash
sudo docker build -t docker-opentracker-image .
```

## RUN

```bash
sudo docker run --restart unless-stopped --name docker-opentracker -d docker-opentracker-image
```

## LOGS

```bash
sudo docker logs -f docker-opentracker
```
