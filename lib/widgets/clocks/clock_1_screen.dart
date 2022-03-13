import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/clocks/clock_1.dart';

class Clock1Screen extends StatelessWidget {
  const Clock1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.grey[800],
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: const Center(
              child: Clock1(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: const Center(
              child: Clock1(
                borderColor: Colors.black,
                hourIndicatorColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
