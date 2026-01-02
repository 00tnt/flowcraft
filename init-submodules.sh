#!/usr/bin/env bash
set -euo pipefail

# you can load the .env into this bash
#source .env

# github access token is necessary
# add it to Environment Variables on Vercel
# or you can access it from .env loaded at the top of this bash
if [ "$MY_ACCESS" == "" ]; then
  echo "Error: MY_ACCESS is empty"
  exit 1
fi

# The path to the .gitmodules file.
ROOT_GITMODULES_FILE=$(find . ! -path "*/node_modules/*" -type f -name ".gitmodules" | head -n 1)
# Check if the .gitmodules file exists
if [ ! -f "$ROOT_GITMODULES_FILE" ]; then
  echo "Error: The file '$ROOT_GITMODULES_FILE' was not found."
  exit 1
fi

process_submodules() {
  local GITMODULES_FILE=$1
  local TARGET_DIR=$(dirname "$GITMODULES_FILE")
  cd "$TARGET_DIR"
  # echo "Parsing submodules information from '$GITMODULES_FILE'..."
  # echo "Current directory: $PWD"
  # store the result into a list
  local LIST_SUBMODULES=$(git config -f .gitmodules --name-only --get-regexp path | sed 's/^submodule\.//;s/\.path$//')

  # loop over the list
  while IFS= read -r INTERNAL_NAME; do
    # INTERNAL_NAME also includes the path to the actual submodule
    # echo "Processing submodule '$INTERNAL_NAME'..."

    local SUBMODULE_URL=$(git config -f .gitmodules --get "submodule.$INTERNAL_NAME.url")
    local SUBMODULE_PATH=$(git config -f .gitmodules --get "submodule.$INTERNAL_NAME.path")

    local SUBMODULE_BRANCH=$(git config -f .gitmodules --get "submodule.$INTERNAL_NAME.branch" || echo "")
    if [ "$SUBMODULE_BRANCH" == "" ]; then
      echo "Error: The branch of the submodule '$INTERNAL_NAME' was not found."
      exit 1
    fi

    local SUBMODULE_SLUG=$(echo "$SUBMODULE_URL" | sed -e 's|https://github.com/||' -e 's|git@github.com:||')
    SUBMODULE_SLUG=${SUBMODULE_SLUG%.git}

    local SUBMODULE_OWNER=$(dirname "$SUBMODULE_SLUG")
    local SUBMODULE_REPO=$(basename "$SUBMODULE_SLUG")

    echo "SUBMODULE_URL: $SUBMODULE_URL"
    echo "SUBMODULE_BRANCH: $SUBMODULE_BRANCH"
    echo "SUBMODULE_PATH: $SUBMODULE_PATH"
    echo "SUBMODULE_SLUG: $SUBMODULE_SLUG"
    echo "SUBMODULE_OWNER: $SUBMODULE_OWNER"
    echo "SUBMODULE_REPO: $SUBMODULE_REPO"

    # Remove existing submodule entry
    echo "Removing existing submodule '$INTERNAL_NAME'..."
    git submodule deinit -f $INTERNAL_NAME || true
    git rm -f $INTERNAL_NAME || true
    rm -rf .git/modules/$INTERNAL_NAME
    rm -rf $SUBMODULE_PATH

    # add the submodule
    echo "Adding submodule '$INTERNAL_NAME'..."
    # git submodule add -b $SUBMODULE_BRANCH $SUBMODULE_URL $SUBMODULE_PATH
    git submodule add -b $SUBMODULE_BRANCH "https://$MY_ACCESS@github.com/$SUBMODULE_OWNER/$SUBMODULE_REPO.git" $SUBMODULE_PATH

    # check for .gitmodules in the submodule
    local SUBMODULE_GITMODULES_FILE=$(find "./$SUBMODULE_PATH" -name ".gitmodules" | head -n 1)
    if [ -f "$SUBMODULE_GITMODULES_FILE" ]; then
      echo "Found .gitmodules in '$SUBMODULE_PATH'"
      echo "Submodules found: $SUBMODULE_GITMODULES_FILE"
      # Start a subshell
      (
        process_submodules "$SUBMODULE_GITMODULES_FILE"
      )
    fi

  done <<<"$LIST_SUBMODULES"
}

process_submodules "$ROOT_GITMODULES_FILE"

# update submodule
# use --remote for fetching the latest changes instead of checking to the specific commit
# --recursive to update all submodules recursively
echo "Updating all submodules..."
git submodule update --init --recursive
