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
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Center(
                child: _passwordInputField(),
              ),
            )));
  }

  TextField _passwordInputField() {
    return TextField(
      autofocus: false,
      maxLength: 4,
      controller: _passwordController,
      onChanged: _changed,
      keyboardType: TextInputType.number,
      scrollPadding: const EdgeInsets.only(bottom: 200),
      onEditingComplete: _onEditComplete,
      textInputAction: TextInputAction.done,
      textDirection: TextDirection.ltr,
      obscureText: true,
      style: const TextStyle(
          fontSize: 32, fontWeight: FontWeight.w400, color: Colors.red),
      decoration: InputDecoration(
          hintText: StringConstants.enterAccountPin,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintStyle: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.grey)),
    );
  }

  void _onChanged(bool value) {}

  void _changed(String value) {}

  void _onEditComplete() {
    Prefs().setAuthToken(_passwordController.text);
    Navigator.of(context).pushNamed(DeveiceSecurityWidget.routeName);
  }
}
