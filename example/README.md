FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================


# iran_plate example

One Iranian car plate, centred, doing nothing dramatic. Swap `IranUsage.private` for
any of the other sixteen classes - `IranUsage.taxi`, `.police`, `.motorcycle` - and both
the geometry and the colour follow.

Run it with `flutter run` from this directory.

```dart
import 'package:flutter/material.dart';
import 'package:core_plate/core_plate.dart';
import 'package:iran_plate/iran_plate.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    const usage = IranUsage.private; // or .taxi, .police, .motorcycle, ...
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PlateCanvas(
              spec: IranPlates.forUsage(usage),
              theme: IranThemes.forUsage(usage),
              onChooseCharacter: (alphabet) async => null,
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
