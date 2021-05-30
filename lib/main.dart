import'package:flutter/material.dart';
import 'package:flutter_app/Users/User List.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'USER INFORMATION',
      debugShowCheckedModeBanner: false,
      home: UserList(),
    );
  }
}


