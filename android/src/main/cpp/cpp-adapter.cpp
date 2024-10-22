#include <jni.h>
#include "MapboxNavigationOnLoad.hpp"

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void*) {
  return margelo::nitro::com::mapboxnavigation::initialize(vm);
}
