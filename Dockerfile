FROM quay.io/obriencj/sibilant as base


# An intermediary container which will have some of the necessary
# tools to build the binary extensions in sibilant. We'll deposit the
# resulting wheel to be installed later

FROM base as builder

COPY setup.py setup.json /build/
COPY sibilant /build/sibilant/

RUN \
  mkdir /wheels && \
  pip wheel -w /wheels /build/


# The real container, installing the wheels built into the /wheels dir
# from the intermediary one.

FROM base

LABEL maintainer = "obriencj@redhat.com" \
      version = "0.9.0"

# http://label-schema.org/rc1/
LABEL org.label-schema.schema-version = "1.0" \
      org.label-schema.name = "sibilant-flask" \
      org.label-schema.version = "0.9.0" \
      org.label-schema.url = "https://github.com/obriencj/python-sibilant-flask" \
      org.label-schema.vcs-url = "https://github.com/obriencj/python-sibilant-flask"


COPY --from=builder /wheels /wheels
RUN \
  pip install /wheels/*.whl && \
  rm -rf /wheels


CMD sibilant


# The end.
