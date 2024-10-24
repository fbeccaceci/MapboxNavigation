package com.margelo.nitro.com.mapboxnavigation

import com.margelo.nitro.core.Promise

class HybridMapboxNavigationViewManagerRegistry: HybridMapboxNavigationViewManagerRegistrySpec() {

  override val memorySize: Long
    get() = 0L

  override fun createViewManager(nitroId: Double): HybridMapboxNavigationViewManagerSpec {
    return Test()
  }

}

class Test() : HybridMapboxNavigationViewManagerSpec() {

  override val memorySize: Long
    get() = 0L

}
