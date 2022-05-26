import 'package:finz/constants/static_cosntants.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
          onPressed: _onBackPressed,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringConstants.deviceSecurity,
              style: const TextStyle(color: Colors.white, fontSize: 24),
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
    );
  }

  void _onChanged(bool value) {
    setState(() {
      _deviceSecurityEnabled = !_deviceSecurityEnabled;
    });
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
  }
}
