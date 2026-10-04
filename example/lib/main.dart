import 'package:flutter/material.dart';
import 'package:plate_core/plate_core.dart';
import 'package:iran_plate/iran_plate.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Any of IranUsage's seventeen classes; spec and theme both come from it.
    const usage = IranUsage.private;
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
