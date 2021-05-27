import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged, TextEditingController controller, String hintText,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _isHidden,
        onChanged: widget.onChanged,
        //Called when the user initiates a change to the TextField's value: when they have inserted or deleted text.
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}


