#!/bin/sh

if [[ -z "${DYNDNS_USER}" || -z "${DYNDNS_PASSWORD}" || -z "${RECORD_LIST}" ]]; then
  echo "[ERROR] Mandatory variable DYNDNS_USER, DYNDNS_PASSWORD or RECORD_LIST not defined."
  exit 1
fi

if [[ -z "${REFRESH_INTERVAL}" ]]; then
  REFRESH_INTERVAL=600
fi

while true; do
  if [ "${SET_IPV4}" = 'yes' ] ; then
    update_ip.sh -4
  fi
  if [ "${SET_IPV6}" = 'yes' ] ; then
    update_ip.sh -6
  fi
  sleep ${REFRESH_INTERVAL} & wait
done
