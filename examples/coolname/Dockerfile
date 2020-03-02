
FROM sibilant-flask

LABEL maintainer = "obriencj@redhat.com" \
      version = "0.9.0"

# http://label-schema.org/rc1/
LABEL org.label-schema.schema-version = "1.0" \
      org.label-schema.name = "sibilant-flask-coolname" \
      org.label-schema.version = "0.9.0" \
      org.label-schema.url = "https://github.com/obriencj/sibilant" \
      org.label-schema.vcs-url = "https://github.com/obriencj/sibilant"

COPY sibfcn /wsgi/sibfcn/

RUN pip install coolname

ENV WSGI_APP "sibfcn.app:app"


# The end.
