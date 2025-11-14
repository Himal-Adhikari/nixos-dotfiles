#!/usr/bin/env bash
set -e

diff_exists=$(git diff flake.lock | wc -l)

if [ "$diff_exists" -ne 0 ]; then
  nix-prefetch-url --type sha256 file:///home/himal/Downloads/stm32cubemon-lin-v-1-11-0.zip &>/dev/null
fi
 
sudo nixos-rebuild switch --flake . &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false
)
