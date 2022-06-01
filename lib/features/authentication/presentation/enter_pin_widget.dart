import 'package:finz/constants/static_cosntants.dart';
import 'package:finz/features/authentication/presentation/device_security_widget.dart';
import 'package:finz/services/prefs_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinLoginWidget extends StatefulWidget {
  static const routeName = '/pin_screen';
  const PinLoginWidget({Key? key}) : super(key: key);

  @override
  State<PinLoginWidget> createState() => _PinLoginWidgetState();
}

class _PinLoginWidgetState extends State<PinLoginWidget> {
  TextEditingController _passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // color: Colors.black,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagePaths.inputBkg), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.zero,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.85),
                  ),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF1E1E20),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: _passwordInputField()))),
            )));
  }

  TextField _passwordInputField() {
    return TextField(
      autofocus: true,
      maxLength: 4,
      controller: _passwordController,
      onChanged: _changed,
      keyboardType: TextInputType.number,
      scrollPadding: const EdgeInsets.only(bottom: 8),
      onEditingComplete: _onEditComplete,
      textInputAction: TextInputAction.done,
      textDirection: TextDirection.ltr,
      keyboardAppearance: Brightness.dark,
      obscureText: true,
      obscuringCharacter: '●',
      textAlign: TextAlign.center,
      showCursor: false,
      style: const TextStyle(
          fontSize: 32, fontWeight: FontWeight.w400, color: Colors.white),
      decoration: InputDecoration(
          label: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringConstants.enterAccountPin,
                ),
              ],
            ),
          ),
          labelStyle: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w400, color: Colors.white),
          hintText: '● ● ● ●',
          border: InputBorder.none,
          hintStyle: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w400, color: Colors.grey)),
    );
  }

  void _onChanged(bool value) {}

  void _changed(String value) {}

  void _onEditComplete() {
    Prefs().setAuthToken(_passwordController.text);
    Navigator.of(context).pushNamed(DeveiceSecurityWidget.routeName);
  }
}
