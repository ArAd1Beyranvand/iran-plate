import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:iran_plate/iran_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: IranPlates.civil, theme: IranThemes.blackOnWhite),
);
