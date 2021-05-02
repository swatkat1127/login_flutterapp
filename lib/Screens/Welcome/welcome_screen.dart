import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/homepage.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    getCredential();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      var token = sharedPreferences.getString("token");
      if (token != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => HomePage()));
      } else {
        return;
      }
    });
  }
}