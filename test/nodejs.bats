#!/usr/bin/env bats

setup() {
  docker history "$REGISTRY/$REPOSITORY:$TAG" >/dev/null 2>&1
  export IMG="$REGISTRY/$REPOSITORY:$TAG"
}

@test "the image has a disk size under 50MB" {
    run docker images $IMG
    echo 'status:' $status
    echo 'output:' $output
    size="$(echo ${lines[1]} | awk -F '   *' '{ print int($5) }')"
    echo 'size:' $size
    [ "$status" -eq 0 ]
    [ $size -lt 10 ]
}

@test "that the image has the correct Node.js version installed" {
  run docker run --rm --entrypoint=/bin/sh $IMG -c "node -v | grep $NODEJS_VERSION"
  [ $status -eq 0 ]
}

@test "that the image has the correct npm version installed" {
  run docker run --rm --entrypoint=/bin/sh $IMG -c "npm -v | grep $NPM_VERSION"
  [ $status -eq 0 ]
}

@test "that /var/cache/apk is empty" {
  run docker run --rm $IMG sh -c "ls -1 /var/cache/apk | wc -l"
  [ $status -eq 0 ]
}

@test "that the root password is disabled" {
  run docker run --user nobody $IMG su
  [ $status -eq 1 ]
}
