import 'package:finz/constants/static_cosntants.dart';
import 'package:finz/features/authentication/application/auth_service.dart';
import 'package:finz/features/authentication/presentation/enter_pin_widget.dart';
import 'package:finz/features/authentication/presentation/face_id_widget.dart';
import 'package:finz/provider/getit.dart';
import 'package:finz/services/prefs_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthSettingsScreen extends StatefulWidget {
  static const routeName = '/auth_settings_screen';
  AuthSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AuthSettingsScreen> createState() => _AuthSettingsScreenState();
}

class _AuthSettingsScreenState extends State<AuthSettingsScreen> {
  GetIt getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: _onBackPressed,
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  // onPressed: _onBackPressed,
                ),
                Text(
                  'Back',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        leadingWidth: 128,
        actions: [
          TextButton(
              onPressed: _onPressedSkip,
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: _mainContent(),
    );
  }

  Widget _mainContent() {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_pageTitle(), _enableButton()],
      ),
    );
  }

  Widget _pageTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.setLoginTitle,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          StringConstants.setLoginDesc,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        )
      ],
    );
  }

  _onBackPressed() {
    // Navigator.of(context).pop();
  }

  _onPressedSkip() {
    Prefs().setAuthEnableStatus("false").then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const PinLoginWidget(),
            settings: const RouteSettings(name: PinLoginWidget.routeName)),
        (Route<dynamic> route) => false,
      );
    });
  }

  _onPressedEnable() {
    Prefs().setAuthEnableStatus("true").then((value) {
      Navigator.of(context).pushNamed(FaceIdWidget.routeName);
    });
  }

  Widget _enableButton() {
    return ElevatedButton(
        onPressed: _onPressedEnable,
        style: ElevatedButton.styleFrom(primary: ColorConstants.primary),
        child: Text(
          StringConstants.enableLogin,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ));
  }
}
