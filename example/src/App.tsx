import { Button, StyleSheet, View } from 'react-native';
import { MapboxNavigationView } from 'react-native-mapbox-navigation';

import { MathModule } from 'react-native-mapbox-navigation';

export default function App() {
  const doStuff = () => {
    const result = MathModule.add(1, 2);

    console.log('Result: ' + result);
  };

  return (
    <View style={styles.container}>
      <View style={styles.content}>
        <MapboxNavigationView color="#32a852" style={styles.box} />

        <Button title="Test nitro module" onPress={doStuff} />
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
