import {
  forwardRef,
  useEffect,
  useImperativeHandle,
  useMemo,
  useRef,
} from 'react';
import { NitroModules } from 'react-native-nitro-modules';

import NativeView, { NativeProps } from './MapboxNavigationViewNativeComponent';
import { MapboxNavigationViewManager } from './MapboxNavigationViewManager.nitro';
import type { MapboxNavigationViewManagerRegistry } from './MapboxNavigationViewManagerRegistry.nitro';
import { NativeSyntheticEvent } from 'react-native';

const MapboxNavigationViewManagerRegistry =
  NitroModules.createHybridObject<MapboxNavigationViewManagerRegistry>(
    'MapboxNavigationViewManagerRegistry'
  );

type ReplacedNativeProps = 'nitroId' | 'onNavigationCameraStateChange';
export type MapboxNavigationViewProps = Omit<
  NativeProps,
  ReplacedNativeProps
> & {
  onNavigationCameraStateChange?: (cameraState: string) => void;
};

export type MapboxNavigationViewRef = {};

let nitroIdCounter = 0;
export const MapboxNavigationView = forwardRef<
  MapboxNavigationViewRef,
  MapboxNavigationViewProps
>((props: MapboxNavigationViewProps, ref) => {
  const nitroId = useMemo(() => nitroIdCounter++, []);
  const nitroViewManager = useRef<MapboxNavigationViewManager | null>(null);

  useEffect(() => {
    // Create a View Manager for the respective View (looked up via `nitroId`)
    setTimeout(() => {
      nitroViewManager.current =
        MapboxNavigationViewManagerRegistry.createViewManager(nitroId);
    }, 100);
  }, [nitroId]);

  useImperativeHandle(ref, () => ({}));

  const _onNavigationCameraStateChange = (
    e: NativeSyntheticEvent<{ payload: string }>
  ) => {
    if (props.onNavigationCameraStateChange) {
      const cameraState = e.nativeEvent.payload;
      props.onNavigationCameraStateChange(cameraState);
    }
  };

  return (
    <NativeView
      nitroId={nitroId}
      {...props}
      onNavigationCameraStateChange={_onNavigationCameraStateChange}
    />
  );
});
