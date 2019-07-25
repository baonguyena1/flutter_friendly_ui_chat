import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Sign Up')),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 0.7 * mediaQuery.size.width),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
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
                height: 16.0,
              ),
              TextFormField(
                maxLength: 8,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    counterText: ''),
                style: TextStyle(color: Colors.black),
                obscureText: true,
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                maxLength: 8,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    counterText: ''),
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
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
