# Minimal docker container to use the `php -S` development server in github actions.

## Usage

```yml
  services:
    php:
      image: jieter/minimal-php
      options: -v /home/runner/work/sailplanner.nl/sailplanner.nl/public/:/home/php --name php
      ports:
        - 8000:8000

```
```yml
    steps:
      - uses: actions/checkout@v2
      # The container is started before the checkout action runs,
      # so we should restart it to make it work
      # (https://github.community/t/services-and-volumes/16313).
      - name: restart php container
        uses: docker://docker
        with:
          args: docker restart php
      - name: curl http://localhost:8000/
```

## Updating the container
```
docker build -t jieter/minimal-php .
docker push jieter/minimal-php
```

Testing the container:
```
docker run  -p 8000:8000 -it jieter/minimal-php
```
open http://localhost:8000/phpinfo.php in a browser.

Or using a local directory:

```
docker run -v /Users/jieter/workspace/sailplanner.nl/public/:/home/php/ -p 8000:8000 -it jieter/minimal-php
```
