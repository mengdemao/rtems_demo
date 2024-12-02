#!/bin/bash

qemu-system-aarch64 -no-reboot -nographic -serial mon:stdio \
 -machine virt,gic-version=3 -cpu cortex-a72 -m 4096 -kernel rtems/examples/build/aarch64-rtems6-a72_lp64_qemu/hello/hello_world_c/hello.exe