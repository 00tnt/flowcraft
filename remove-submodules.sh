#!/usr/bin/env bash

git submodule deinit -f --all

git rm -f apps/be

rm -rf .git/modules/apps/be

git config -f .git/config --remove-section submodule.apps/be
