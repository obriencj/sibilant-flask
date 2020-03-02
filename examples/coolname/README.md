# Coolname Sibilant WSGI Example

A simple flask app written in Sibilant to generate coolname slugs

```bash
pip3 install coolname
./run.sh
```

## Docker

```bash
docker build . -t sibilant/coolname
docker run -p 8080:8080 sibilant/coolname
```

 or

```bash
docker build . -f Dockerfile.gunicorn -t sibilant/coolname-gunicorn
docker run -p 8080:8080 sibilant/coolname-gunicorn
```
