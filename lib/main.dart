import 'package:flutter/material.dart';
import 'package:friendly_chat/controllers/ChatScreen.dart';
import 'package:friendly_chat/controllers/login/Login.dart';

void main() => runApp(FriendlyChatApp());

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _initialView = Login();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friendly Chat',
      home: _initialView,
      routes: <String, WidgetBuilder> {
        '/chat': (BuildContext context) => ChatScreen(),
        '/login': (BuildContext context) => Login()
      },
    );
  }
}