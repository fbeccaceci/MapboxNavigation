///
/// JHybridMapboxNavigationViewManagerRegistrySpec.cpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

#include "JHybridMapboxNavigationViewManagerRegistrySpec.hpp"

// Forward declaration of `HybridMapboxNavigationViewManagerSpec` to properly resolve imports.
namespace margelo::nitro::com::mapboxnavigation { class HybridMapboxNavigationViewManagerSpec; }

#include <memory>
#include "HybridMapboxNavigationViewManagerSpec.hpp"
#include "JHybridMapboxNavigationViewManagerSpec.hpp"
#include <NitroModules/JNISharedPtr.hpp>

namespace margelo::nitro::com::mapboxnavigation {

  jni::local_ref<JHybridMapboxNavigationViewManagerRegistrySpec::jhybriddata> JHybridMapboxNavigationViewManagerRegistrySpec::initHybrid(jni::alias_ref<jhybridobject> jThis) {
    return makeCxxInstance(jThis);
  }

  void JHybridMapboxNavigationViewManagerRegistrySpec::registerNatives() {
    registerHybrid({
      makeNativeMethod("initHybrid", JHybridMapboxNavigationViewManagerRegistrySpec::initHybrid),
    });
  }

  size_t JHybridMapboxNavigationViewManagerRegistrySpec::getExternalMemorySize() noexcept {
    static const auto method = _javaPart->getClass()->getMethod<jlong()>("getMemorySize");
    return method(_javaPart);
  }

  // Properties
  

  // Methods
  std::shared_ptr<margelo::nitro::com::mapboxnavigation::HybridMapboxNavigationViewManagerSpec> JHybridMapboxNavigationViewManagerRegistrySpec::createViewManager(double nitroId) {
    static const auto method = _javaPart->getClass()->getMethod<jni::local_ref<JHybridMapboxNavigationViewManagerSpec::javaobject>(double /* nitroId */)>("createViewManager");
    auto result = method(_javaPart, nitroId);
    return JNISharedPtr::make_shared_from_jni<JHybridMapboxNavigationViewManagerSpec>(jni::make_global(result));
  }

} // namespace margelo::nitro::com::mapboxnavigation
