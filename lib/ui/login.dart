import 'package:flutter/material.dart';

import 'package:show_time/ui/dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        width: screen.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 320.0,
              height: 320.0,
              child: Image.asset('assets/cinemaLogo.png'),
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              child: Form(
                key: _key,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'E-mail',
                          hintText: 'E-mail address',
                          border: OutlineInputBorder()),
                    ),
                    Container(height: 32.0),
                    TextFormField(
                      controller: _password,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'samplepass',
                          border: OutlineInputBorder()),
                    ),
                    Container(height: 32.0),
                    RaisedButton(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Dashboard()));
                            ;
                            print('pressed');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return null;
  }
}
