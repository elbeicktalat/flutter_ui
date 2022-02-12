import 'package:flutter/material.dart';
import 'package:flutter_ui/auths/auth2/auth_2.dart';
import 'package:flutter_ui/profiles/profile8/profile_8.dart';
import 'package:flutter_ui/profiles/profile9/profile_9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Profile9(),
    );
  }
}
