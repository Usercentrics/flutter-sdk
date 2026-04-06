#!/bin/sh -xe

rm -rf TestResults.xcresult

xcodebuild test -workspace 'Runner.xcworkspace' \
                -scheme 'Runner' \
                -destination 'platform=iOS Simulator,name=iPhone 15 Pro,OS=17.4' \
                -enableCodeCoverage YES \
                -resultBundlePath TestResults
