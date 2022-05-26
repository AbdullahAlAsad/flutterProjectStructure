import 'package:finz/constants/static_cosntants.dart';
import 'package:finz/features/authentication/application/auth_service.dart';
import 'package:finz/features/authentication/presentation/auth_setting_widget.dart';
import 'package:finz/features/authentication/presentation/enter_pin_widget.dart';
import 'package:finz/features/authentication/presentation/face_id_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GetIt getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      initData().then((value) {
        var authService = getIt<AuthService>();
        authService.isAuthenabled().then((status) {
          if (status) {
            authService.checkBiometrics().then((hasBiometric) {
              if (hasBiometric) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FaceIdWidget(),
                      settings:
                          const RouteSettings(name: FaceIdWidget.routeName)),
                  (Route<dynamic> route) => false,
                );
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PinLoginWidget(),
                      settings:
                          const RouteSettings(name: PinLoginWidget.routeName)),
                  (Route<dynamic> route) => false,
                );
              }
            });
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => AuthSettingsScreen(),
                  settings:
                      const RouteSettings(name: AuthSettingsScreen.routeName)),
              (Route<dynamic> route) => false,
            );
          }
        });
      });
    });
  }

  Future initData() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Image.asset(
            ImagePaths.splashLogo,
          ),
        ),
      ),
    );
  }
}
