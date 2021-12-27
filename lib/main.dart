import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile1/profile.dart';
import 'package:flutter_ui/profiles/profile2/profile.dart';

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
      home: const Profile2(),
    );
  }
}
