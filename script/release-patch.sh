#!/bin/bash

set -e

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
TARGET_BRANCH="$1"
BUILD_NUMBER="$2"

# Step 1: Checkout dev
git checkout dev
git reset origin/dev --hard

# Step 2: Replace "TBD" with the current date
CURRENT_DATE="$(date +%-m\/%-d\/%Y)"
sed -i '' -e "s!#### Date: TBD!#### Date: ${CURRENT_DATE}!g" "${SCRIPTPATH}/../CHANGELOG.md"

# Step 3: Commit Change
git add "${SCRIPTPATH}/../CHANGELOG.md"
git commit -m "chore: Update CHANGELOG Date"

# 4. Merge dev into the target branch
git checkout "$TARGET_BRANCH"
git fetch origin
git reset "origin/$TARGET_BRANCH" --hard
git merge -X theirs --no-ff dev

# 5. Get version
VERSION=$("${SCRIPTPATH}/next_version.sh" "${BUILD_NUMBER}")

# 6/ Run `lerna version` specify patch
lerna version "$VERSION" --yes --no-push

# 7. Push to origin with tags
git push origin --follow-tags