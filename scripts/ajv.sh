#!/bin/sh

CGREEN="\e[32m"
CNORMAL="\e[0m"

printf "== ${CGREEN}Start entrypoint ${0}${CNORMAL} ==\n"

printf "Billal test container image\n"
printf "Installed version of ajv / ajv-cli: "
npm --prefix /ajv list

printf "== ${CGREEN}End entrypoint ${0}${CNORMAL} ==\n"

exec "$@"
