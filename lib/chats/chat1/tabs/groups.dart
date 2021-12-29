import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Groups',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
