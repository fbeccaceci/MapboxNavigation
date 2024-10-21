import { useRef } from 'react';
import { Button, StyleSheet, View } from 'react-native';
import {
  MapboxNavigationView,
  MapboxNavigationViewRef,
} from 'react-native-mapbox-navigation';
import { request, PERMISSIONS } from 'react-native-permissions';

export default function App() {
  const mapRef = useRef<MapboxNavigationViewRef>(null);

  const doStuff = () => {
    mapRef.current?.randomTestFunction().then(() => console.log('Done'));
  };

  const requestPermission = () => {
    request(PERMISSIONS.IOS.LOCATION_ALWAYS).then((status) => {
      console.log('JS result: ' + status);
    });
  };

  return (
    <View style={styles.container}>
      <View style={styles.content}>
        <MapboxNavigationView ref={mapRef} style={styles.box} />

        <Button title="Test nitro module" onPress={doStuff} />
        <Button
          title="Request location permission"
          onPress={requestPermission}
        />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  content: {
    width: '100%',
    alignItems: 'center',
    gap: 20,
  },
  box: {
    width: '100%',
    aspectRatio: 0.7,
  },
});
