import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Sign Up')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 0.7 * mediaQuery.size.width),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Divider(
                          height: 2,
                        ),
                      ),
                      TextFormField(
                        maxLength: 8,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: InputBorder.none,
                          counterText: '',
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Theme.of(context).primaryColorDark,
                            onPressed: _changePasswordVisible,
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                        obscureText: !_passwordVisible,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Divider(
                          height: 2,
                        ),
                      ),
                      TextFormField(
                        maxLength: 8,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Confirm your password',
                          hintStyle: TextStyle(color: Colors.black38),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: InputBorder.none,
                          counterText: '',
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Theme.of(context).primaryColorDark,
                            onPressed: _changeConfirmPasswordVisible,
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                        obscureText: !_confirmPasswordVisible,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
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
      ),
    );
  }

  void _changePasswordVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _changeConfirmPasswordVisible() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }
}
