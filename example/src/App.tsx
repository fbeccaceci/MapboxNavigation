import { useRef } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import {
  MapboxNavigationView,
  MapboxNavigationViewRef,
} from 'react-native-mapbox-navigation';
import { request, PERMISSIONS } from 'react-native-permissions';

export default function App() {
  const mapRef = useRef<MapboxNavigationViewRef>(null);

  const requestPermission = () => {
    request(PERMISSIONS.IOS.LOCATION_ALWAYS).then((status) => {
      console.log('JS result: ' + status);
    });
  };

  return (
    <View style={styles.container}>
      <View style={styles.content}>
        <MapboxNavigationView
          ref={mapRef}
          style={styles.map}
          styleUrl="mapbox://styles/mapbox/outdoors-v12"
          puckType="2d"
        />

        <View style={styles.overlay}>
          <TouchableOpacity style={styles.button} onPress={requestPermission}>
            <Text style={styles.buttonText}>Request location permission</Text>
          </TouchableOpacity>
        </View>
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
    flex: 1,
  },
  map: {
    width: '100%',
    flex: 1,
  },

  overlay: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,

    pointerEvents: 'box-none',

    alignItems: 'center',
    justifyContent: 'flex-end',
    paddingBottom: 50,

    gap: 12,
  },

  button: {
    paddingVertical: 8,
    paddingHorizontal: 16,
    borderRadius: 8,
    backgroundColor: '#212529',
  },
  buttonText: {
    color: '#f8f9fa',
    fontSize: 18,
  },
});
