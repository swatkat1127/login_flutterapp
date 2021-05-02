import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}


