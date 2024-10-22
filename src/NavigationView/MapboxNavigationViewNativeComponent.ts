import type { ViewProps } from 'react-native';
import type { Double } from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

// import type { NativeEdgeInsets, NativePoint } from './models/native';

// type Test = {
//   top: Double;
//   left: Double;
//   bottom: Double;
//   right: Double;
// };

export interface NativeProps extends ViewProps {
  nitroId: Double;
  styleUrl?: string;
  puckType?: string;
  // viewportPadding?: NativeEdgeInsets;
  // logoMargin?: NativePoint;
}

export default codegenNativeComponent<NativeProps>('MapboxNavigationView');
