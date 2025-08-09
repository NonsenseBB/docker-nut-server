FROM alpine:latest

ARG S6_OVERLAY_VERSION=3.2.1.0

# Install nut 2.8.3+ from edge community and other packages from stable
RUN apk update && apk add --no-cache \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    nut-dev \
    nut-openrc \
    usbutils \
    gettext

# Install S6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz && \
    rm -f /tmp/s6-overlay-noarch.tar.xz /tmp/s6-overlay-x86_64.tar.xz

# Copy your rootfs folder content
COPY rootfs /

# Expose NUT network port
EXPOSE 3493

# Environment variables
ENV NUT_UPS_NAME=myups \
    NUT_DRIVER=usbhid-ups \
    NUT_LISTEN_PORT=3493 \
    NUT_ADMIN_PASS=admin \
    NUT_USER_PASS=monitor123

# Set S6 overlay init as entrypoint
ENTRYPOINT ["/init"]

