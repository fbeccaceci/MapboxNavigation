package com.mapboxnavigation

import android.content.Context
import android.widget.FrameLayout
import com.mapbox.maps.MapView

class MapboxNavigationView(context: Context) : FrameLayout(context) {

  init {
    // Create the child view
    val childView = MapView(context)

    // Create LayoutParams that will make the child fill the parent
    val params = LayoutParams(
      LayoutParams.MATCH_PARENT,
      LayoutParams.MATCH_PARENT
    )

    // Add the view
    addView(childView, params)
  }

}
