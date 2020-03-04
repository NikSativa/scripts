#!/bin/sh

[ -d "./.bin" ] && ./.bin/pod install || pod install
