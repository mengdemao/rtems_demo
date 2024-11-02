#!/bin/bash

#shellcheck disable=SC2034
#shellcheck disable=SC2086
#shellcheck disable=SC2046
#shellcheck disable=SC2155

export INSTALL_PATH=$(pwd)/INSTALL

build_rtems_tools()
{
    pushd rtems/tools >> /dev/null || exit
    ./waf distclean
    ./waf configure --prefix=${PREFIX_PATH}
    ./waf build install
    popd >> /dev/null || exit
}

build_rtems_sdk()
{
    pushd rtems/rtems >> /dev/null || exit
    ./waf distclean
    echo -e ${CFG_FILE} > config.ini
    ./waf configure --prefix=${PREFIX_PATH}
    ./waf -j$(nproc)
    ./waf install
    popd >> /dev/null || exit
}

build_rtems_bsd()
{
    pushd rtems/libbsd >> /dev/null || exit
    echo -e ${CFG_FILE} > config.ini
    ./waf configure --prefix=${PREFIX_PATH}
    ./waf -j$(nproc)
    ./waf install
    popd >> /dev/null || exit
}

build_rtems_demo()
{
    pushd rtems/examples >> /dev/null || exit
    ./waf configure --rtems=${PREFIX_PATH} \
                    --rtems-tools=${PREFIX_PATH}\
                    --rtems-bsps=${RTMES_ARCH}/${RTMES_BSP}
    ./waf -v
    popd >> /dev/null || exit
}

export RTMES_ARCH=$1
export RTMES_BSP=$2

export PREFIX_PATH=${INSTALL_PATH}/rtems-${RTMES_ARCH}
export PATH=$PATH:${PREFIX_PATH}/bin
export CFG_FILE="[${RTMES_ARCH}/${RTMES_BSP}]"

build_rtems_tools
build_rtems_sdk
if [ ${RTMES_ARCH} == aarch64 ]; then
build_rtems_bsd
fi
build_rtems_demo
