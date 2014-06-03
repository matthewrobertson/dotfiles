export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
 
export FB_OBJC=${HOME}/src/fbobjc
export FB_ANDROID=${HOME}/src/fbandroid
export FB_WEBRTC=${HOME}/src/fbwebrtc
export FB_OBJC_WEBRTC_MASTER=${FB_OBJC}/VendorLib/fbwebrtc_master
export FB_OBJC_WEBRTC=${FB_OBJC}/VendorLib/fbwebrtc
function voipstartios() {
  if [ -d "${FB_OBJC_WEBRTC_MASTER}" ]; then
    echo "${FB_OBJC_WEBRTC_MASTER} already exists."
    return
  fi
  mv "${FB_OBJC_WEBRTC}" "${FB_OBJC_WEBRTC_MASTER}"
  ln -s "${FB_WEBRTC}" "${FB_OBJC_WEBRTC}"
}
function voipendios() {
  if [ ! -d "${FB_OBJC_WEBRTC_MASTER}" ]; then
    echo "${FB_OBJC_WEBRTC_MASTER} does not exist."
    return
  fi
  rm "${FB_OBJC_WEBRTC}"
  mv "${FB_OBJC_WEBRTC_MASTER}" "${FB_OBJC_WEBRTC}"
}
# Android Build copy debug so for testing
function bcdso() {
  ~/src/fbwebrtc/scripts/build/android/build_fbwebrtc.sh debug armv7
  ~/src/fbwebrtc/scripts/build/android/build_fbwebrtc.sh debug armv5
  cp ~/src/fbwebrtc/out/armv5/Debug/libfb_webrtc_jni.so ~/src/fbandroid/native/webrtc/libs/armeabi/libfb_webrtc_jni.so
  cp ~/src/fbwebrtc/out/armv7/Debug/libfb_webrtc_jni.so ~/src/fbandroid/native/webrtc/libs/armeabi-v7a/libfb_webrtc_jni.so
}
# Android Build copy release so
function bcrso() {
  ~/src/fbwebrtc/scripts/build/android/build_all_fbwebrtc.sh --copy
}

#Android Build for testing
alias buildso='scripts/build/android/build_fbwebrtc.sh release armv5 --copy && scripts/build/android/build_fbwebrtc.sh release armv7 --copy'
alias buildso5='scripts/build/android/build_fbwebrtc.sh release armv5 --copy'
alias buildso7='scripts/build/android/build_fbwebrtc.sh release armv7 --copy'
