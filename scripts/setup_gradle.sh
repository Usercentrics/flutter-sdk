#!/bin/sh -xe

GRADLE_VERSION=6.7

mkdir -p ci-cache/gradle
cd ci-cache/gradle

curl -L -s "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip" \
     --output "gradle-$GRADLE_VERSION-bin.zip"
unzip -qq gradle-6.7-bin.zip
rm gradle-6.7-bin.zip

cd ../../

./ci-cache/gradle/gradle-6.7/bin/gradle wrapper --gradle-version 6.7 --distribution-type all

export PATH="$(pwd)/ci-cache/gradle/gradle-6.7/bin/gradle:$PATH"
