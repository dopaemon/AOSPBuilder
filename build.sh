#!/bin/bash
set -e

PWDIR=$(pwd)
OUTPUT=$PWDIR/../out
mkdir -p "$OUTPUT"

# Xiaomi 12S Build
cd "$PWDIR/packages/apps/Settings"
git reset --hard HEAD

sed -i 's/Nothing Phone 2/Xiaomi 12S/g' res/values/lunaris_strings.xml
sed -i 's/Snapdragon® 8\+ Gen 1/Snapdragon® 8+ Gen 1/g' res/values/lunaris_strings.xml
sed -i 's/4700 mAh/4500 mAh/g' res/values/lunaris_strings.xml
sed -i 's/Amoled LTPO 120hz/Amoled 120hz/g' res/values/lunaris_strings.xml

cd "$PWDIR"
. build/envsetup.sh
lunch lineage_mayfly-bp2a-user
m lunaris -j"$(nproc --all)" | tee log.txt

FILE=$(ls out/target/product/mayfly/Lunaris-AOSP-mayfly-Community-*.zip 2>/dev/null | head -n 1)

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    mv "$FILE" "$OUTPUT/"
else
    echo "Missing File !!!"
    exit 1
fi
