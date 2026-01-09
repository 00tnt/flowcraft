#!/usr/bin/env bash
echo "Updating all submodules..."

git rm -rf apps/be
git submodule add -f -b develop https://github.com/flowcraft/flowcraft.git apps/be
git submodule status
