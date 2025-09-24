#!/usr/bin/env bash
set -e
sudo nixos-rebuild switch --flake . &>nixos-switch.log || (
  cat nixos-switch.log | grep --color error && false
)
