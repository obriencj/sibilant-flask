FROM quay.io/obriencj/sibilant

LABEL maintainer = "obriencj@redhat.com" \
      version = "0.9.0"

# http://label-schema.org/rc1/
LABEL org.label-schema.schema-version = "1.0" \
      org.label-schema.name = "sibilant-flask" \
      org.label-schema.version = "0.9.0" \
      org.label-schema.url = "https://github.com/obriencj/sibilant-flask" \
      org.label-schema.vcs-url = "https://github.com/obriencj/sibilant-flask"

COPY setup.py setup.json /build/
COPY sibilant /build/sibilant/

RUN \
  pip install --upgrade pip setuptools wheel flask && \
  pip install /build && \
  rm -rf /build


ARG WSGI_APP
ENV WSGI_APP ${WSGI_APP:-app}

ARG WSGI_PORT
ENV WSGI_PORT ${WSGI_PORT:-8080}

EXPOSE ${WSGI_PORT}

WORKDIR /wsgi/
ENV PYTHONPATH /wsgi/

CMD FLASK_APP="${WSGI_APP}" python3 -m flask run \
    --host 0.0.0.0 --port ${WSGI_PORT}


# The end.
