import 'package:flutter/material.dart';

class Online extends StatelessWidget {
  const Online({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Online',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
