import 'package:finz/features/authentication/presentation/auth_setting_widget.dart';
import 'package:finz/features/authentication/presentation/device_security_widget.dart';
import 'package:finz/features/authentication/presentation/enter_pin_widget.dart';
import 'package:finz/features/authentication/presentation/face_id_widget.dart';
import 'package:finz/splash_screen.dart';
import 'package:flutter/material.dart';

const String initialRoute = SplashScreen.routeName;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AuthSettingsScreen.routeName:
        return MaterialPageRoute(builder: (_) => AuthSettingsScreen());
      case FaceIdWidget.routeName:
        return MaterialPageRoute(builder: (_) => FaceIdWidget());
      case PinLoginWidget.routeName:
        return MaterialPageRoute(builder: (_) => const PinLoginWidget());
      case DeveiceSecurityWidget.routeName:
        return MaterialPageRoute(builder: (_) => const DeveiceSecurityWidget());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
