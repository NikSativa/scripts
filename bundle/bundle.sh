#!/bin/sh

bundler_exist=$(gem query -i -n bundle)

if ! $bundler_exist ; then
	gem install bundler
fi

bundle $@
