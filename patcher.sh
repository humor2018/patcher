#!/bin/sh

# Apply these patches before compilation:

ROM_TREE=$PWD
PATCHER_PATH=$ROM_TREE/patcher
SULTAN=$PATCHER_PATH/sultan
ZX2C4=$PATCHER_PATH/zx2c4
CUSTOM=$PATCHER_PATH/custom

# Clean up first
cd $ROM_TREE/build
git clean -f -d && git reset --hard
cd $ROM_TREE/device/oppo/common
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/av
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/base
git clean -f -d && git reset --hard
cd $ROM_TREE/frameworks/native
git clean -f -d && git reset --hard
cd $ROM_TREE/kernel/oneplus/msm8996
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Gallery2
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/LockClock
git clean -f -d && git reset --hard
cd $ROM_TREE/packages/apps/Settings
git clean -f -d && git reset --hard
cd $ROM_TREE/system/core
git clean -f -d && git reset --hard
cd $ROM_TREE/vendor/cm
git clean -f -d && git reset --hard

cd $ROM_TREE

### Sultan's patches
patch -d build					-p1 -s -N --no-backup-if-mismatch < $SULTAN/build0.patch
patch -d device/oppo/common			-p1 -s -N --no-backup-if-mismatch < $SULTAN/device-oppo-common0.patch
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-av0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base0.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base1.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base2.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base3.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base4.patch
patch -d frameworks/base			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-base5.patch
patch -d frameworks/native			-p1 -s -N --no-backup-if-mismatch < $SULTAN/frameworks-native0.patch
#patch -d packages/apps/LockClock		-p1 -s -N --no-backup-if-mismatch < $SULTAN/packages-apps-LockClock0.patch
#patch -d packages/apps/Settings			-p1 -s -N --no-backup-if-mismatch < $SULTAN/packages-apps-Settings0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SULTAN/system-core0.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SULTAN/system-core1.patch
patch -d system/core				-p1 -s -N --no-backup-if-mismatch < $SULTAN/system-core2.patch
patch -d vendor/cm				-p1 -s -N --no-backup-if-mismatch < $SULTAN/vendor-cm0.patch
#patch -d vendor/cm				-p1 -s -N --no-backup-if-mismatch < $SULTAN/vendor-cm1.patch

### zx2c4's patches
$ZX2C4/wireguard-fetch.sh || rm -f $ZX2C4/wireguard-src.patch
patch -d kernel/oneplus/msm8996			-p1 -s -N --no-backup-if-mismatch < $ZX2C4/wireguard-src.patch

### Custom patches
patch -d frameworks/av				-p1 -s -N --no-backup-if-mismatch < $CUSTOM/frameworks-av0.patch
patch -d packages/apps/Gallery2			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Gallery20.patch
patch -d packages/apps/Gallery2			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Gallery21.patch
patch -d packages/apps/Gallery2			-p1 -s -N --no-backup-if-mismatch < $CUSTOM/packages-apps-Gallery22.patch
