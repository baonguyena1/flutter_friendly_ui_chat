import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 0.7 * mediaQuery.size.width),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.black38),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLength: 8,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                style: TextStyle(color: Colors.black),
                obscureText: true,
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'OR',
                style: TextStyle(fontSize: 13.0, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                child: Text('Register new account',
                    style: TextStyle(
                      color: Colors.green,
                      decoration: TextDecoration.underline
                    )),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
