#!/bin/bash

#shellcheck disable=SC2034
#shellcheck disable=SC2086
#shellcheck disable=SC2046
#shellcheck disable=SC2155

export ROOT_PATH=$(pwd)
export INSTALL_PATH=${ROOT_PATH}/INSTALL
export RTMES_ARCH=$1
export RTEMS_VERSION=$2
export PREFIX_PATH=${INSTALL_PATH}/rtems-${RTMES_ARCH}

# pushd rtems/rsb/rtems >>/dev/null || exit
# ../source-builder/sb-set-builder --prefix=${PREFIX_PATH} ${RTEMS_VERSION}/rtems-${RTMES_ARCH}.bset --jobs=$(nproc)
# popd >>/dev/null || exit

pushd ${PREFIX_PATH}

find bin -type f -executable | xargs strip --strip-unneeded
find libexec -type f -executable | xargs strip --strip-unneeded
find ${RTMES_ARCH}-rtems6 -type f -executable | xargs strip --strip-unneeded

popd