#!/bin/bash

git clone --depth=1 https://github.com/RTEMS/rtems-source-builder.git rtems/rsb
git clone --depth=1 https://github.com/RTEMS/rtems.git rtems/rtems
git clone --depth=1 https://github.com/RTEMS/rtems-tools.git rtems/tools
git clone --recurse-submodules --shallow-submodules https://github.com/RTEMS/rtems-libbsd.git rtems/libbsd
git clone --recurse-submodules --shallow-submodules https://github.com/RTEMS/rtems-examples.git rtems/examples

pushd rtems/examples >> /dev/null | exit
git apply ../../patch/examples.patch
popd >> /dev/null | exit