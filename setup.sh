#!/bin/bash

# check if IDF_PATH is set
if [ -z "$IDF_PATH" ]; then
    echo "Please follows the instruction of ESP-IDF installation and set IDF_PATH."
    exit 1
fi

RMDCMD='/bin/rm -rf'
MKDCMD='/bin/mkdir'
CPDCMD='/bin/cp'

SCRIPTDIR=`dirname $0`
SCRIPTDIR=`cd $SCRIPTDIR && pwd -P`

CRYPTAUTH_TRGDIR=${IDF_PATH}/components/cryptoauthlib
CRYPTAUTHAL_TRGDIR=${IDF_PATH}/components/cryptoauthlib_hal

if [ ! -d $IDF_PATH ]; then
    echo "ESP-IDF Development Framework doesn't exist.: $IDF_PATH"
    exit 1
fi

# Copy files into ESP-IDF development framework
pushd $IDF_PATH > /dev/null

echo "Copy files into $IDF_PATH"
# Remove/Create directories
${RMDCMD} ${CRYPTAUTH_TRGDIR}/
${MKDCMD} ${CRYPTAUTH_TRGDIR}/

${RMDCMD} ${CRYPTAUTHAL_TRGDIR}/
${MKDCMD} ${CRYPTAUTHAL_TRGDIR}/

popd > /dev/null             # $SCRIPTDIR

# copying ... cryptoauthlib folder into $IDF_PATH/components folder
${CPDCMD} -r ./cryptoauthlib/cryptoauthlib/lib ${CRYPTAUTH_TRGDIR}

${CPDCMD} ./cryptoauthlib/cryptoauthlib/README.md ${CRYPTAUTH_TRGDIR}
${CPDCMD} ./cryptoauthlib/cryptoauthlib/appveyor.yml ${CRYPTAUTH_TRGDIR}
${CPDCMD} ./cryptoauthlib/cryptoauthlib/license.txt ${CRYPTAUTH_TRGDIR}

${CPDCMD} ./cryptoauthlib/component.mk ${CRYPTAUTH_TRGDIR}
${CPDCMD} ./cryptoauthlib_hal/component.mk ${CRYPTAUTHAL_TRGDIR}

exit 1
