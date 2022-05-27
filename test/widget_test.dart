// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:finz/features/authentication/presentation/device_security_widget.dart';
import 'package:finz/features/authentication/presentation/enter_pin_widget.dart';
import 'package:finz/main.dart';
import 'package:finz/setup_test_dependcies.dart';
import 'package:finz/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    setupDependencyInjection();
  });
  group('App', () {
    testWidgets('RunApp', (tester) async {
      await tester.pumpWidget(MyApp());
    });
    testWidgets('Open Splash', (tester) async {
      await tester.pumpWidget(SplashScreen());
    });
    testWidgets('Open Pin screen', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PinLoginWidget(),
      ));
      expect(find.byElementType(TextField), findsOneWidget);
    });
    testWidgets('Open homepage', (tester) async {
      await tester.pumpWidget(DeveiceSecurityWidget());
    });
  });
}
