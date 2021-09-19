# Running a container as a systemd service

This example runs the `rclone` as a service daily.

# Quick Start

1. Modify `rclone.service` to point to the path of `docker-compose.yml`.

   ```sh
   sed -i 's/\/srv\/rclone/\/path\/to\/docker-compose.yml/g' rclone.service
   ```

2. Modify `unit-status-mail@.service` to point to the path of `unit-status-mailer.sh`

   ```sh
   sed -i 's/\/opt\/unit-status-mailer.sh/\/path\/to\/unit-status-mailer.sh/g' unit-status-mail@.service
   ```

4. If you want to change the frequency which the job is run, change the `OnCalendar` value in `rclone.timer`.

5. Copy `rclone.service`, `rclone.timer`, and `unit-status-mail@.service` to `/etc/systemd/system/multi-user.target.wants`.

   ```sh
   sudo cp rclone.service rclone.timer unit-status-mail\@.service /etc/systemd/system/multi-user.target.wants
   ```

6. Enable the service.

   ```sh
   systemctl daemon-reload
   systemctl enable rclone
   ```
