#!/bin/sh -xe

rm -rf TestResults.xcresult

xcodebuild test -workspace 'Runner.xcworkspace' \
                -scheme 'Runner' \
                -destination 'platform=iOS Simulator,name=iPhone 15 Pro,OS=18.1' \
                -enableCodeCoverage YES \
                -resultBundlePath TestResults
