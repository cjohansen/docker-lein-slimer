# Clojure, Leiningen, and Slimer

If you have a Clojure project that uses slimer for frontend testing, then this
Docker image might just be for you.

Basically an amalgamation of

- https://hub.docker.com/_/clojure/
- https://hub.docker.com/r/evpavel/slimerjs-alpine/
- `tzdata` (allowing you to control the timezone in which your frontend tests run)

Usage:

```sh
docker run -v /my/project:/app -it cjohansen/lein-slimer:lein-2.8.1-slimer-1.0.0 bash
cd /app
lein doo slimer test once
```
