# rclone examples

## config-volume-example

This example shows how to use a bind volume to persist your rclone configuration(s). It also sets the `RCLONE_CONFIG` variable.

```sh
docker-compose -f docker-compose.yml -f examples/config-volume-example.yml run rclone config show
```

## swarm-example

This example shows how to deploy with Docker Swarm. It uses the `deploy` block to constrain resources and restart the container every 12 hours to sync files between a S3 bucket and NFS volume. It uses `secrets` to store AWS credentials, `configs` to store rclone configuration, and Docker NFS volume type.

```sh
docker stack deploy -c docker-compose.yml -c exmaples/swarm-example.yml rclone
```

## compose-example

This example shows how to deploy with `docker-compose`. It's a little less featured than Swarm without the `deploy` or `config` support, but it does support `docker-compose run` which can be helpful in development.

```sh
docker-compose -f docker-compose.yml -f examples/compose-example.yml run rclone config show
```