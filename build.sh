#!/usr/bin/env bash
set -e
nix-prefetch-url --type sha256 file:///home/himal/Downloads/stm32cubemon-lin-v-1-11-0.zip &>/dev/null
sudo nixos-rebuild switch --flake . &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false
)
