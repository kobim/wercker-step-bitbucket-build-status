#!/bin/bash

if [ ! -n "$BUILD" ]; then
  fail 'Bitbucket build status should be used only for build steps.'
fi

if [ "$WERCKER_GIT_DOMAIN" != "bitbucket.org" ]; then
  fail 'Bitbucket build status should only be used for bitbucket repositories.'
fi

if [ ! -n "$WERCKER_BITBUCKET_BUILD_STATUS_USERNAME" ]; then
  fail 'Missing username property.'
fi

if [ ! -n "$WERCKER_BITBUCKET_BUILD_STATUS_PASSWORD" ]; then
  fail 'Missing password property.'
fi

AUTH="$WERCKER_BITBUCKET_BUILD_STATUS_USERNAME":"$WERCKER_BITBUCKET_BUILD_STATUS_PASSWORD"

if [ ! -n "$WERCKER_RESULT" ]; then
  export STATE='INPROGRESS'
else
  if [ "$WERCKER_RESULT" = "passed" ]; then
    export STATE='SUCCESSFUL'
  else
    export STATE='FAILED'
  fi
fi

PAYLOAD="state=$STATE&key=$WERCKER_BUILD_ID&url=$WERCKER_BUILD_URL"
URL="https://api.bitbucket.org/2.0/repositories/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY/commit/$WERCKER_GIT_COMMIT/statuses/build"

RESULT=`curl -d "$PAYLOAD" -u $AUTH -s "$URL" --output $WERCKER_STEP_TEMP/result.txt -w "%{http_code}"`

if [ "$RESULT" = "500" ]; then
  echo $RESULT
  fail 'Something bad happened (error 500)'
fi

if [ "$RESULT" = "404" ]; then
  fail "Repository or commit hash not found."
fi
