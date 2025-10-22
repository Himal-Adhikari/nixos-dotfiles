#!/usr/bin/env bash
set -e
nix_gen=$(nixos-rebuild list-generations | grep -i true | cut -d ' ' -f1)
printf -v commit_msg "Generation %s" "$nix_gen"
git add .
git commit -m "$commit_msg"
git push
