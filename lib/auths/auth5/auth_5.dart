import 'dart:ui';

import 'package:flutter/material.dart';

class Auth5 extends StatefulWidget {
  const Auth5({Key? key}) : super(key: key);

  @override
  State<Auth5> createState() => _Auth5State();
}

class _Auth5State extends State<Auth5> {
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

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = ThemeData();
    return Theme(
      data: _theme.copyWith(
        colorScheme: _theme.colorScheme.copyWith(
          primary: Colors.orange.shade700,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade700,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: _Background(
                  color: Colors.red.shade700,
                  leftPoint: 0.45,
                  rightPoint: 0.45,
                  shapeHeight: 0.6,
                ),
                child: Container(),
              ),
              CustomPaint(
                painter: _Background(
                  color: Colors.orange.shade700,
                  leftPoint: 0.3,
                  rightPoint: 0.3,
                  shapeHeight: 0.75,
                ),
                child: Container(),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/profiles/me.jpg'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome back!',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Please login to continue',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(height: 18.0),
                        _form(context),
                        const SizedBox(height: 18.0),
                        _actions(context),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'email@addres.com',
              prefixIcon: Icon(Icons.email, color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 4.0),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: '********',
              hintStyle: TextStyle(letterSpacing: 1.8),
              prefixIcon: Icon(Icons.key, color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 8.0),
        TextButton(
          onPressed: () {},
          child: const Text('Create one'),
        ),
      ],
    );
  }
}

class _Background extends CustomPainter {
  final double leftPoint;
  final double rightPoint;
  final double shapeHeight;
  final Color color;

  _Background({
    required this.leftPoint,
    required this.rightPoint,
    required this.shapeHeight,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * leftPoint);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * shapeHeight,
      0,
      size.height * rightPoint,
    );
    path.lineTo(0, size.height * 0.3);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
