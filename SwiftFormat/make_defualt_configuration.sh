#!/bin/bash

PATH_TO_SWIFT_FORMAT=$(xcrun --find swift-format)
SRC_ROOT_PATH=$(PWD)

$PATH_TO_SWIFT_FORMAT dump-configuration > $SRC_ROOT_PATH/swift-format-default-config.json
