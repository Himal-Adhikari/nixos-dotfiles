#!/usr/bin/env bash
set -e
home-manager switch --flake . &> nixos-user.log || (
  cat nixos-user.log | grep --color error && false
)
