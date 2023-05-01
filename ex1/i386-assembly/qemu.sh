#!/usr/bin/env bash
# Needs to be writable, so make a copy
tmp="$(mktemp -d)"
cp "$1" "$tmp/bootloader"
chmod u+w "$tmp/bootloader"

qemu-system-i386 -nographic -net none -drive format=raw,file="$tmp/bootloader" "${@:2}"

rm "$tmp/bootloader"
