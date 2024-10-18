///
/// HybridNitroMapboxNavigationViewManagerRegistrySpec.cpp
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

#include "HybridNitroMapboxNavigationViewManagerRegistrySpec.hpp"

namespace margelo::nitro::iplastudio::mapboxnavigation {

  void HybridNitroMapboxNavigationViewManagerRegistrySpec::loadHybridMethods() {
    // load base methods/properties
    HybridObject::loadHybridMethods();
    // load custom methods/properties
    registerHybrids(this, [](Prototype& prototype) {
      prototype.registerHybridMethod("createViewManager", &HybridNitroMapboxNavigationViewManagerRegistrySpec::createViewManager);
    });
  }

} // namespace margelo::nitro::iplastudio::mapboxnavigation
