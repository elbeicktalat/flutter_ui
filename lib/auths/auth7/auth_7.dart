import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth7 extends StatefulWidget {
  const Auth7({Key? key}) : super(key: key);

  @override
  State<Auth7> createState() => _Auth7State();
}

class _Auth7State extends State<Auth7> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  final _boxShadow = BoxShadow(
    blurRadius: 30,
    color: Colors.black.withOpacity(0.2),
  );

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(letterSpacing: 1.4),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );

    return Theme(
      data: _theme,
      child: Scaffold(
        body: Stack(
          children: [
            CustomPaint(
              painter: _Circles(),
              child: Container(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [_boxShadow],
                  ),
                  child: Text(
                    'Welcome to Custom Paint',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.4,
                        ),
                  ),
                ),
                _form(context),
                _actions(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'email@address.com',
                prefixIconColor: Colors.white,
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
                hintText: '********',
                prefixIconColor: Colors.white,
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.maxFinite,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [_boxShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Create one',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Circles extends CustomPainter {
  final int count;

  _Circles([this.count = 100]);

  final List<double> _opacities = [0.6, 0.7, 0.8, 0.9, 1.0];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.teal,
    Colors.blueGrey,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i <= count; i++) {
      _drawCircle(canvas, size);
    }
  }

  void _drawCircle(Canvas canvas, Size size) {
    Random random = Random();
    Color color = _colors[random.nextInt(_colors.length)];
    double opacity = _opacities[random.nextInt(_opacities.length)];
    double radius = random.nextInt(80).toDouble();
    Offset offset = Offset(
      random.nextInt(size.width.toInt()).toDouble(),
      random.nextInt(size.height.toInt()).toDouble(),
    );
    Paint paint = Paint();
    paint.color = color.withOpacity(opacity);
    Path path = Path();
    Rect shadowRect = Rect.fromCircle(center: offset, radius: radius + 5);
    path.addOval(shadowRect);
    canvas.drawShadow(path, Colors.black.withOpacity(0.4), 8, true);
    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
