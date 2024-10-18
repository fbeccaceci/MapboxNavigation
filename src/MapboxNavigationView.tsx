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
import { NitroMapboxNavigationViewManagerRegistry } from './NitroMapboxNavigationViewManagerRegistry.nitro';

const MapboxNavigationViewManagerRegistry =
  NitroModules.createHybridObject<NitroMapboxNavigationViewManagerRegistry>(
    'NitroMapboxNavigationViewManagerRegistry'
  );

export type MapboxNavigationViewProps = Omit<NativeProps, 'nitroId'>;

export type MapboxNavigationViewRef = {
  randomTestFunction(): Promise<void>;
};

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

  const randomTestFunction = async () => {
    await nitroViewManager.current?.randomTestFunction();
  };

  useImperativeHandle(ref, () => ({
    randomTestFunction,
  }));

  return <NativeView nitroId={nitroId} {...props} />;
});
