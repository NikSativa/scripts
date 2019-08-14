#!/bin/sh

PROJECT_CONFIG="-workspace *.xcworkspace -scheme AllTests -sdk iphonesimulator -configuration Debug"

# folders
TOP_WORK_DIR="`cd "${dirToNormalize}";pwd`"
BUILD_DIR="$TOP_WORK_DIR/Build"
DERIVED_DATA="$BUILD_DIR/DerivedData"
MODULE_CACHE="$DERIVED_DATA/ModuleCache"
SYMROOT="$DERIVED_DATA/Products/"

# logs
SPECS_CLEAN_TXT="$BUILD_DIR/clean.txt"
SPECS_BUILD_TXT="$BUILD_DIR/specs-build.txt"
SPECS_TEST_TXT="$BUILD_DIR/specs-test.txt"

echo "removing DerivedData..."
sh $(dirname "$0")/../rm/derivedData.sh

echo "removing focuses..."
sh $(dirname "$0")/nof.sh

#echo "shutdown all simulators"
#xcrun simctl shutdown all

# This global override is needed for a bug in the Simulator. The device key is not enough as of Xcode 9.4
echo "disconnect hardware keyboard"
defaults write com.apple.iphonesimulator ConnectHardwareKeyboard -bool no

#echo "bott all simulators"
#xcrun simctl list | grep -w “Shashi” | awk -F “[\(\)]” '{ for (i=2; i<NF; i+=2) print $i }' | grep '^[-A-Z0–9]*$' | xargs -I uuid xcrun simctl delete uuid
#xcrun simctl delete unavailable

# create 'Build' folder before `xcodebuild` commands
mkdir -p $BUILD_DIR

echo "cleaning..."
xcodebuild $PROJECT_CONFIG \
clean 2>&1 | tee $SPECS_CLEAN_TXT | xcpretty -t -c || exit ${PIPESTATUS[0]}

echo "building..."
xcodebuild $PROJECT_CONFIG \
-destination 'generic/platform=iOS Simulator' \
-derivedDataPath $DERIVED_DATA \
MODULE_CACHE_DIR=$MODULE_CACHE \
SYMROOT=$SYMROOT \
build-for-testing 2>&1 | tee $SPECS_BUILD_TXT | xcpretty -t -c || exit ${PIPESTATUS[0]}

echo "testing..."
xcodebuild $PROJECT_CONFIG \
-destination 'platform=iOS Simulator,name=iPhone 8,OS=12.1' \
-derivedDataPath $DERIVED_DATA \
MODULE_CACHE_DIR=$MODULE_CACHE \
SYMROOT=$SYMROOT \
test-without-building 2>&1 | tee $SPECS_TEST_TXT | xcpretty -t -c || exit ${PIPESTATUS[0]}

echo "connect hardware keyboard"
defaults delete com.apple.iphonesimulator ConnectHardwareKeyboard 2> /dev/null

echo "jobs done"
