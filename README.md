# Overview of sibilant-flask

[Sibilant] is a dialect of [Lisp] which compiles to [Python] bytecode.

This package provides `sibilant.site.flask` which contains macros for
defining Flask endpoints. It's primarily an example on how to use the
`sibilant.site` namespace package, and a way to set up containers
running Sibilant-based [WSGI] applications easily.

[Sibilant]: https://github.com/obriencj/python-sibilant/

[LISP]: https://en.wikipedia.org/wiki/Lisp_(programming_language)

[Python]: https://python.org/

[WSGI]: https://wsgi.readthedocs.io/


## Dockerfiles

* `Dockerfile` the simple default, this runs [Flask] directly (not for
  production)
* `Dockerfile.gunicorn` uses [Gunicorn] as the WSGI server.

Both are based on the `python:3.7-alpine` image with Sibilant
pre-installed.

I've tried to make all the containers work as similarly as possible,
taking two primary environment parameters:

* `WSGI_PORT` defaults to 8080 and is the in-container port the WSGI
  server will be listening on
* `WSGI_APP` defaults to `app` and is the default application module
  name used to start application. This should be overridden in child
  containers to refer to the real name

[Flask]: https://palletsprojects.com/p/flask

[Gunicorn]: https://gunicorn.org


## Examples

There is a simple [Coolname] slug generator WSGI application under the
`examples` directory.

[Coolname]: https://alexanderlukanin13/coolname


## Contact

Author: Christopher O'Brien  <obriencj@gmail.com>

IRC Channel: #python-sibilant on [Freenode]

Original Git Repository: <https://github.com/obriencj/sibilant-flask>

[Freenode]: https://freenode.net


## License

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 3 of the
License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, see
<http://www.gnu.org/licenses/>.
