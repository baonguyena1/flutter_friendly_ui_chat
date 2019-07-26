import 'dart:async';
import 'dart:math';

class AuthService {
  static Future<bool> login() async {
    return await Future<bool>.delayed(
      Duration(
        seconds: 3
      ), () => Random().nextBool()
    );
  }

  static Future<bool> logout() async {
    return await Future<bool>.delayed(
      Duration(
        seconds: 3
      ), () => Random().nextBool()
    );
  }
}