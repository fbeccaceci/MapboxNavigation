package com.mapboxnavigation

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

@ReactModule(name = MapboxNavigationViewManager.NAME)
class MapboxNavigationViewManager :
  MapboxNavigationViewManagerSpec<MapboxNavigationView>() {
  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): MapboxNavigationView {
    return MapboxNavigationView(context)
  }

// Need to check this with old arch
//  @ReactProp(name = "color")
//  override fun setColor(view: MapboxNavigationView?, color: String?) {
//    view?.setBackgroundColor(Color.parseColor(color))
//  }

  companion object {
    const val NAME = "MapboxNavigationView"
  }

  override fun setNitroId(view: MapboxNavigationView?, value: Double) {
    TODO("Not yet implemented")
  }

  override fun setStyleUrl(view: MapboxNavigationView?, value: String?) {
    TODO("Not yet implemented")
  }

  override fun setPuckType(view: MapboxNavigationView?, value: String?) {
    TODO("Not yet implemented")
  }
}
