#!/bin/bash
echo "Ingrese comando { start ,stop }"

read comando

if [[ $comando == "start" ]];then
SERVER_INSTALL_DIR= pwd 
cd ${SERVER_INSTALL_DIR}/bin
nohup ${SERVER_INSTALL_DIR}/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -c standalone-full.xml\
      --debug \
      0<&- &>/dev/null &
echo "El bpm inicio correctamente"

else

IPADDR=localhost
EAP_MGMT_PORT=9990
SERVER_INSTALL_DIR=pwd
${SERVER_INSTALL_DIR}/bin/jboss-cli.sh --connect --controller=${IPADDR}:${EAP_MGMT_PORT} ":shutdown"


fi


