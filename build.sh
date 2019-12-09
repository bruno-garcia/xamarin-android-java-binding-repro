#!/bin/bash
set -e

pushd android-lib
./gradlew assembleRelease
cp build/outputs/aar/android-lib-release.aar ../xamarin-lib/Xamarin.Android.Binding/Jars/
popd
pushd xamarin-lib
msbuild /restore /p:Configuration=Release \
    /p:AndroidBuildApplicationPackage=true \
    # /p:AndroidSdkBuildToolsVersion=29.0.0 \
    # /p:AndroidSdkPlatformToolsVersion=29.0.0 \
    /t:Build\;SignAndroidPackage
popd