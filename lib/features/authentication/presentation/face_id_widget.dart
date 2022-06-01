import 'package:finz/constants/static_cosntants.dart';
import 'package:finz/features/authentication/application/auth_service.dart';
import 'package:finz/features/authentication/presentation/device_security_widget.dart';
import 'package:finz/features/authentication/presentation/enter_pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class FaceIdWidget extends StatefulWidget {
  static const routeName = '/face_id_screen';
  FaceIdWidget({Key? key}) : super(key: key);

  @override
  State<FaceIdWidget> createState() => _FaceIdWidgetState();
}

class _FaceIdWidgetState extends State<FaceIdWidget> {
  GetIt getIt = GetIt.instance;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Center(
                child: InkWell(
                  onTap: _onPressedFaceId,
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: const Icon(
                            Icons.face_outlined,
                            color: Colors.white,
                            size: 72,
                          ),
                        ),
                        Text(
                          StringConstants.faceId,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 24),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (_isAuthenticating)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          )),
    );
  }

  _onPressedFaceId() {
    var authService = getIt<AuthService>();
    authService.checkBiometrics().then((hasBiometrics) {
      if (hasBiometrics) {
        _authenticateWithBiometrics(authService).then((value) {
          if (value) {
            Navigator.of(context).pushNamed(DeveiceSecurityWidget.routeName);
          }
        });
      } else {
        Navigator.of(context).pushReplacementNamed(PinLoginWidget.routeName);
      }
    }).onError((error, stackTrace) {
      Navigator.of(context).pushReplacementNamed(PinLoginWidget.routeName);
    });
  }

  Future<bool> _authenticateWithBiometrics(authService) async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await authService.authenticateWithBiometrics();
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pushReplacementNamed(PinLoginWidget.routeName);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return false;
    }
    if (!mounted) {
      return false;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
    return authenticated;
  }
}
