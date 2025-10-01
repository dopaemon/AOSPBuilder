#!/bin/bash
set -e

PWDIR=$(pwd)
OUTPUT=$PWDIR/../out
mkdir -p "$OUTPUT"

# ============================================================
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

FILE=$(ls out/target/product/mayfly/Lunaris-AOSP-*-Community-*.zip 2>/dev/null | head -n 1)

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    mv "$FILE" "$OUTPUT/"
else
    echo "Missing File !!!"
    exit 1
fi

# ============================================================
# Xiaomi 12S Pro
cd "$PWDIR/packages/apps/Settings"
git reset --hard HEAD

sed -i 's/Nothing Phone 2/Xiaomi 12S Pro/g' res/values/lunaris_strings.xml
sed -i 's/Snapdragon® 8\+ Gen 1/Snapdragon® 8+ Gen 1/g' res/values/lunaris_strings.xml
sed -i 's/4700 mAh/4600 mAh/g' res/values/lunaris_strings.xml
sed -i 's/Amoled LTPO 120hz/Amoled 120hz/g' res/values/lunaris_strings.xml

cd "$PWDIR"
. build/envsetup.sh
lunch lineage_unicorn-bp2a-user
m lunaris -j"$(nproc --all)" | tee log.txt

FILE=$(ls out/target/product/unicorn/Lunaris-AOSP-*-Community-*.zip 2>/dev/null | head -n 1)

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    mv "$FILE" "$OUTPUT/"
else
    echo "Missing File !!!"
    exit 1
fi

# ============================================================
# Xiaomi 12T Pro
cd "$PWDIR/packages/apps/Settings"
git reset --hard HEAD

sed -i 's/Nothing Phone 2/Xiaomi 12T Pro/g' res/values/lunaris_strings.xml
sed -i 's/Snapdragon® 8\+ Gen 1/Snapdragon® 8+ Gen 1/g' res/values/lunaris_strings.xml
sed -i 's/4700 mAh/5000 mAh/g' res/values/lunaris_strings.xml
sed -i 's/Amoled LTPO 120hz/Amoled 120hz/g' res/values/lunaris_strings.xml

cd "$PWDIR"
. build/envsetup.sh
lunch lineage_diting-bp2a-user
m lunaris -j"$(nproc --all)" | tee log.txt

FILE=$(ls out/target/product/diting/Lunaris-AOSP-*-Community-*.zip 2>/dev/null | head -n 1)

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    mv "$FILE" "$OUTPUT/"
else
    echo "Missing File !!!"
    exit 1
fi

# ============================================================
# Xiaomi 12 Pro
cd "$PWDIR/packages/apps/Settings"
git reset --hard HEAD

sed -i 's/Nothing Phone 2/Xiaomi 12 Pro/g' res/values/lunaris_strings.xml
sed -i 's/Snapdragon® 8\+ Gen 1/Snapdragon® 8 Gen 1/g' res/values/lunaris_strings.xml
sed -i 's/4700 mAh/4600 mAh/g' res/values/lunaris_strings.xml
sed -i 's/Amoled LTPO 120hz/Amoled 120hz/g' res/values/lunaris_strings.xml

cd "$PWDIR"
. build/envsetup.sh
lunch lineage_zeus-bp2a-user
m lunaris -j"$(nproc --all)" | tee log.txt

FILE=$(ls out/target/product/zeus/Lunaris-AOSP-*-Community-*.zip 2>/dev/null | head -n 1)

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
    mv "$FILE" "$OUTPUT/"
else
    echo "Missing File !!!"
    exit 1
fi
