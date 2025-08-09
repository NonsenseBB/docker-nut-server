# docker-nut-server

This Docker image provides a Network UPS Tools (NUT) server based on Alpine Linux, using the S6 overlay for process supervision.

## Quick Start

### Using Docker CLI

```bash
docker run -d \
  --name nut-server \
  --restart unless-stopped \
  --device /dev/bus/usb:/dev/bus/usb \
  -p 3493:3493 \
  -e NUT_UPS_NAME=myups \
  -e NUT_DRIVER=usbhid-ups \
  -e NUT_LISTEN_PORT=3493 \
  -e NUT_ADMIN_PASS=admin \
  -e NUT_USER_PASS=monitor123 \
  ghcr.io/nonsensebb/docker-nut-server:latest
```

### Using Docker Compose

```yaml
version: '3.8'

services:
  nut-server:
    image: ghcr.io/nonsensebb/docker-nut-server:latest
    container_name: nut-server
    restart: unless-stopped
    devices:
      - /dev/bus/usb:/dev/bus/usb
    ports:
      - "3493:3493"
    environment:
      NUT_UPS_NAME: myups
      NUT_DRIVER: usbhid-ups
      NUT_LISTEN_PORT: 3493
      NUT_ADMIN_PASS: admin
      NUT_USER_PASS: monitor123
```

## Configuration

### Environment Variables

- `NUT_UPS_NAME`: UPS device name (default: `myups`).
- `NUT_DRIVER`: UPS driver name (default: `usbhid-ups`).
- `NUT_LISTEN_PORT`: Port for NUT server to listen on (default: `3493`).
- `NUT_ADMIN_PASS`: Password for the admin user.
- `NUT_USER_PASS`: Password for the monitoring user.

### Ports

- `3493/tcp`: NUT server port.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
