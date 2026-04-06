#!/bin/sh -xe

rm -rf TestResults.xcresult

xcodebuild test -workspace 'Runner.xcworkspace' \
                -scheme 'Runner' \
                -destination 'platform=macOS,arch=arm64,variant=Designed for [iPad,iPhone]' \
                -enableCodeCoverage YES \
                -resultBundlePath TestResults
