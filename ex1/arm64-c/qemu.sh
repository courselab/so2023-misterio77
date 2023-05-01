#!/usr/bin/env bash
qemu-system-aarch64 -M virt -nographic -cpu cortex-a72 -kernel "$1" "${@:2}"
