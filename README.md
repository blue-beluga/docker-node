
# [<img src=".bluebeluga.png" height="100" width="200" style="border-radius: 50%;" alt="@fancyremarker" />](https://github.com/blue-beluga/docker-node) bluebeluga/node

Alpine Linux image with Node.js.

## Installation and Usage

```
docker pull bluebeluga/node
docker run bluebeluga/node [options]
```

## Available Tags

* `latest`: Currently v6.2.2
* `6.2.2`:
* `6.2.1`:
* `6.2.0`:
* `6.1.0`:
* `6.0.0`:
* `5.11.0`:
* `4.4.3`:
* `0.10.44`:
* `0.12.13`:
* `0.12.14`:
* `0.12.15`:

## Tests

Tests are run as part of the `Makefile` build process. To execute them run the following command:

```
make test
```

## Deployment

To push the Docker image to the registry, run the following command:

```
make push
```
