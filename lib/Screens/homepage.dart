import 'package:flutter/material.dart';
import 'package:flutter_auth/placeholder.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.deepOrange),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      //we set the currentIndex of the bottom navigation bar to the current index held in our state’s _currentIndex property.
      print('index'); // to check index
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        //onTap property set to onTapTapped function which will take in the index of the tab that is tapped and
        // decide what to do with it
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            // ignore: deprecated_member_use
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              // ignore: deprecated_member_use
              title: Text('Profile')
          )
        ],
      ),
      );
  }
}


