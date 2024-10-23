import type { ViewProps } from 'react-native';
import type { Double } from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

type EdgeInsets = {
  top: Double;
  right: Double;
  bottom: Double;
  left: Double;
};

type Point = {
  x: Double;
  y: Double;
};

export interface NativeProps extends ViewProps {
  nitroId: Double;
  styleUrl?: string;
  puckType?: string;
  viewportPadding?: EdgeInsets;
  logoMargin?: Point;
}

export default codegenNativeComponent<NativeProps>('MapboxNavigationView');
