#! /bin/bash

ABS_PATH=$(readlink -f "$0")
ABS_DIR=$(dirname "$ABS_PATH")
source "$ABS_DIR"/profile.sh

IDLE_CONTAINER=$(find_idle_profile)

if [ "$(docker ps -aqf name="^$IDLE_CONTAINER$")" ];
then
  docker-compose -f docker-compose.prod.yml rm -s -v -f "$IDLE_CONTAINER"
else
  echo "> 구동 중인 유휴 spring container가 없으므로 종료하지 않습니다."
fi
