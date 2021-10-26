# docker-glbd

docker-compose example:

```
version: '3.8'

services:
  glbd:
    image: ezkrg/glbd:latest
    command: [ "--fifo=/var/run/glbd.fifo", "--control=0.0.0.0:8011", "8010", "galera01:3306:5", "galera02:3306:5", "galera03:3306:0" ]
    networks:
        db: {}
    ports:
        - 8010:8010
        - 8011:8011
```