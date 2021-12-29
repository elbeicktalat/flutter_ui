import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'History',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
