#!/bin/sh -xe

rm -rf TestResults.xcresult

xcodebuild test -workspace 'Runner.xcworkspace' \
                -scheme 'Runner' \
                -destination 'platform=iOS Simulator,name=iPhone 14 Pro' \
                -enableCodeCoverage YES \
                -resultBundlePath TestResults
