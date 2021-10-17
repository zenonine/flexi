import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void setPhysicalSize(WidgetTester tester, Size size) {
  tester.binding.window.physicalSizeTestValue = size;
  tester.binding.window.devicePixelRatioTestValue = 1.0;
}
