#!/bin/bash

export QEMU_AUDIO_DRV="none"
qemu-system-arm -net none -nographic -M realview-pbx-a9 -m 256M -kernel rtems/examples/build/arm-rtems6-realview_pbx_a9_qemu/hello/hello_world_c/hello.exe