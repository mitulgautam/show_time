import 'package:flutter/material.dart';
import 'package:show_time/ui/login.dart';
import 'package:show_time/ui/signup.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          child: Icon(
            Icons.account_circle,
            size: 32.0,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => Signup(),
              ),
            );
          },
        ),
      ),
    );
  }
}
