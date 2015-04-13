if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

  export ANDROID_NDK=${HOME}/android-ndk-r10c
  export ANDROID_SDK=${HOME}/android-sdk-macosx
  export ANDROID_HOME=${ANDROID_SDK}

  export FB_OBJC=${HOME}/src/fbobjc
  export FB_ANDROID=${HOME}/src/fbandroid
  export FB_OBJC_WEBRTC=${FB_OBJC}/VendorLib/fbwebrtc

  export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools:${ANDROID_NDK}

  # arcanist for ios
  export PATH=$HOME/src/devtools/arcanist/bin/:$PATH
  export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools:${ANDROID_NDK}

  # Android Build copy debug so for testing
  function bcdso() {
    ${FB_OBJC_WEBRTC}/scripts/build/android/build_fbwebrtc.sh debug armv7 voice --copy
    ${FB_OBJC_WEBRTC}/scripts/build/android/build_fbwebrtc.sh debug armv5 voice --copy
    ${FB_OBJC_WEBRTC}/scripts/build/android/build_fbwebrtc.sh debug armv7 video --copy
    cp ${FB_ANDROID}/native/webrtc/voice/libs/armeabi/libfb_webrtc_jni.so ${FB_ANDROID}/native/webrtc/video/libs/armeabi/
  }
  # Android Build copy release so
  function bcrso() {
    ${FB_OBJC_WEBRTC}/scripts/build/android/build_all_fbwebrtc.sh --copy
  }
fi