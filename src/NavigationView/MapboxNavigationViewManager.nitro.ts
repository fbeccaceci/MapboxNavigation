import { type HybridObject } from 'react-native-nitro-modules';

export interface MapboxNavigationViewManager
  extends HybridObject<{ ios: 'swift'; android: 'kotlin' }> {
  randomTestFunction(): Promise<void>;
}
