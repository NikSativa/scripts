#!/bin/sh

version="2.1.4"
bundler_exist=$(gem query -i -n bundle -v $version)

if ! $bundler_exist ; then
	gem install bundler -v $version
fi

bundle $@
