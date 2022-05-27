import 'package:finz/features/authentication/application/auth_service.dart';
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
  group('functions', () {
    test('Biometric status', () async {
      var authService = AuthService();
      var status = await authService.checkBiometrics();
      print('authService.isAuthenabled $status');
      expect(status, 'true');
    });
    test('Device auth enable status', () async {
      var authService = AuthService();
      var status = await authService.isAuthenabled();
      print('authService.isAuthenabled $status');
      expect(status, 'true');
    });
  });
}
