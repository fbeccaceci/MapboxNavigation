import { HybridObject } from 'react-native-nitro-modules';
import { MapboxNavigationViewManager } from './MapboxNavigationViewManager.nitro';

export interface MapboxNavigationViewManagerRegistry
  extends HybridObject<{ ios: 'swift'; android: 'kotlin' }> {
  createViewManager(nitroId: number): MapboxNavigationViewManager;
}
