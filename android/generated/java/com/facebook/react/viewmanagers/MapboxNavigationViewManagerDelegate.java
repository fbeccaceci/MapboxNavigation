/**
* This code was generated by [react-native-codegen](https://www.npmjs.com/package/react-native-codegen).
*
* Do not edit this file as changes may cause incorrect behavior and will be lost
* once the code is regenerated.
*
* @generated by codegen project: GeneratePropsJavaDelegate.js
*/

package com.facebook.react.viewmanagers;

import android.view.View;
import androidx.annotation.Nullable;
import com.facebook.react.uimanager.BaseViewManagerDelegate;
import com.facebook.react.uimanager.BaseViewManagerInterface;

public class MapboxNavigationViewManagerDelegate<T extends View, U extends BaseViewManagerInterface<T> & MapboxNavigationViewManagerInterface<T>> extends BaseViewManagerDelegate<T, U> {
  public MapboxNavigationViewManagerDelegate(U viewManager) {
    super(viewManager);
  }
  @Override
  public void setProperty(T view, String propName, @Nullable Object value) {
    switch (propName) {
      case "nitroId":
        mViewManager.setNitroId(view, value == null ? Double.NaN : ((Double) value).doubleValue());
        break;
      case "styleUrl":
        mViewManager.setStyleUrl(view, value == null ? null : (String) value);
        break;
      case "puckType":
        mViewManager.setPuckType(view, value == null ? null : (String) value);
        break;
      default:
        super.setProperty(view, propName, value);
    }
  }
}
