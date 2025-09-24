#!/usr/bin/env bash
set -e
nix_gen=$(nixos-rebuild list-generations | grep -i true | cut -d ' ' -f1)
home_gen=$(home-manager generations | grep -i current | cut -d ' ' -f5)
printf -v commit_msg "(Nixos, home-manager) = (%s, %s)" "$nix_gen" "$home_gen"
git commit -m "$commit_msg"
git push
