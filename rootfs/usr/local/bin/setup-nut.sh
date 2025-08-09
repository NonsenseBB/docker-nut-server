#!/command/with-contenv sh

mkdir -p /var/log/nut-server
mkdir -p /var/run/nut
mkdir -p /var/run/s6/container_environment

printf "true" > /var/run/s6/container_environment/NUT_QUIET_INIT_UPSNOTIFY

envsubst < /etc/nut/ups.conf.tpl > /etc/nut/ups.conf
envsubst < /etc/nut/upsd.conf.tpl > /etc/nut/upsd.conf
envsubst < /etc/nut/upsd.users.tpl > /etc/nut/upsd.users
envsubst < /etc/nut/upsmon.conf.tpl > /etc/nut/upsmon.conf


