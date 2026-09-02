# iran_plate example

One Iranian car plate, centred, doing nothing dramatic. Swap `IranPlates.car` for
`IranPlates.bicycle` if you want a smaller one.

Run it with `flutter run` from this directory.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_plate/core_plate.dart';
import 'package:iran_plate/iran_plate.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    const spec = IranPlates.car; // or IranPlates.bicycle
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocProvider(
              create: (_) => PlateCardBloc(spec),
              child: PlateCanvas(
                spec: spec,
                onChooseCharacter: (alphabet) async => null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

The letter slot opens a picker in real life. Here `onChooseCharacter` shrugs and
returns `null`; pass `PlateCharacterPicker.show` from `plate_keypad` for the real one.

The `dependency_overrides` block in `pubspec.yaml` resolves the sibling packages from
this checkout. Delete it when you copy this into an app of your own.
