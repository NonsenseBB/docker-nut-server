[admin]
    password = ${NUT_ADMIN_PASS}
    actions = SET
    instcmds = ALL

[${NUT_USER_NAME}]
    password = ${NUT_USER_PASS}
    upsmon primary
    actions = SET
    instcmds = ALL

