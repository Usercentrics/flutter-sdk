#!/bin/sh -xe

rm -rf TestResults.xcresult

xcodebuild test -workspace 'Runner.xcworkspace' \
                -scheme 'Runner' \
                -destination 'platform=macOS,name=My Mac' \
                -enableCodeCoverage YES \
                -resultBundlePath TestResults
