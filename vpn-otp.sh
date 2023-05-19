#!/bin/bash

# this is a wrapper function for `op` 1Password binary & `openvpn`!
# this function will fetch current TOTP & config location based on 1Password
vpnotp() {
        otp=$(op item get "${1}" --otp)

        USERNAME="<your VPN Username>"
        CONFIG=$(op item get "${1}" | grep path | awk '{ print $2 }')

        AUTH_FILE="/tmp/temp-auth-vpn-${1}"
        echo "${USERNAME}" > ${AUTH_FILE}
        echo "${otp}" >> ${AUTH_FILE}

        sudo openvpn --config ${CONFIG} --auth-user-pass ${AUTH_FILE}

        rm ${AUTH_FILE}
}