import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/homepage.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              controller: TextEditingController(),
              onChanged: (value) {
                email = value.trim();
              },
            ),
            RoundedPasswordField(
              controller: TextEditingController(),
              onChanged: (value) {
                password = value.trim();
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                String loginUrl = env['baseUrl']+'/auth/login/';
                print("login url: $loginUrl");
                var response = await http.post(
                  loginUrl,
                  headers: {"Accept": "application/json"},
                  body: { "email":email, "password": password},
                );
                var data = json.decode(response.body);
                print("sent from server::");
                print(data);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('email', email);
                prefs.setString('token', data['token']);

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => HomePage()));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
