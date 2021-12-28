import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile3/profile.dart';
import 'package:flutter_ui/profiles/profile4/profile_4.dart';
import 'package:flutter_ui/profiles/profile5/profile_5.dart';
import 'package:flutter_ui/profiles/profile6/profile_6.dart';
import 'package:flutter_ui/profiles/profile7/profile_7.dart';

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
      home: const Profile7(),
    );
  }
}
