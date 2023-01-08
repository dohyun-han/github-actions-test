#! /bin/bash

# nginx와 연결되지 않은 profile 찾기
function find_idle_profile() {
  RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/profile)

  if [ "$RESPONSE_CODE" -ge 400 ]
  then
    CURRENT_PROFILE=spring2
  else
    CURRENT_PROFILE=$(curl -s http://localhost/profile)
  fi

  # nginx와 연결되지 않은 profile 설정
  if [ "$CURRENT_PROFILE" == spring1 ]
  then
    IDLE_PROFILE=spring2
  else
    IDLE_PROFILE=spring1
  fi

  echo "$IDLE_PROFILE"
}
