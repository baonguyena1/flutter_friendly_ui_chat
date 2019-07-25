import 'package:flutter/material.dart';
import 'package:friendly_chat/controllers/ChatScreen.dart';
import 'package:friendly_chat/controllers/login/Login.dart';

void main() => runApp(FriendlyChatApp());

final ThemeData kDefaultTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friendly Chat',
      theme: kDefaultTheme,
      home: Login(),
    );
  }
}