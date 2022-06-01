import 'dart:io';

import 'package:finz/constants/static_cosntants.dart';
import 'package:finz/features/authentication/presentation/enter_pin_widget.dart';
import 'package:finz/features/authentication/presentation/face_id_widget.dart';
import 'package:finz/services/prefs_services.dart';
import 'package:flutter/material.dart';

class DeveiceSecurityWidget extends StatefulWidget {
  static const routeName = '/device_security_screen';
  const DeveiceSecurityWidget({Key? key}) : super(key: key);

  @override
  State<DeveiceSecurityWidget> createState() => _DeveiceSecurityWidgetState();
}

class _DeveiceSecurityWidgetState extends State<DeveiceSecurityWidget> {
  bool _deviceSecurityEnabled = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      Prefs().getAuthEnableStatus().then((value) {
        setState(() {
          if (value == "true") {
            _deviceSecurityEnabled = true;
          } else {
            _deviceSecurityEnabled = false;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          leading: Container(),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  StringConstants.deviceSecurity,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    softWrap: true,
                    StringConstants.enableDevicePass,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Switch(
                    value: _deviceSecurityEnabled,
                    onChanged: _onChanged,
                    activeColor: ColorConstants.primary,
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onChanged(bool value) {
    Prefs()
        .setAuthEnableStatus(_deviceSecurityEnabled ? "true" : "fale")
        .then((value) {
      setState(() {
        _deviceSecurityEnabled = !_deviceSecurityEnabled;
      });
    });
  }

  void _onBackPressed() {
    if (_deviceSecurityEnabled) {
      Navigator.of(context).pushReplacementNamed(FaceIdWidget.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(PinLoginWidget.routeName);
    }
  }

  Future<bool> _onPop() async {
    if (_deviceSecurityEnabled) {
      Navigator.of(context).pushReplacementNamed(FaceIdWidget.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(PinLoginWidget.routeName);
    }
    return false;
  }
}
