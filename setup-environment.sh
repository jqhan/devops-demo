#!/bin/sh
rm .git/hooks/*
find .git/hooks -type l -exec rm {} \; && find .githooks -type f -exec ln -sf ../../{} .git/hooks/ \;
