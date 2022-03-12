import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth4 extends StatefulWidget {
  const Auth4({Key? key}) : super(key: key);

  @override
  State<Auth4> createState() => _Auth4State();
}

class _Auth4State extends State<Auth4> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;

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
    ThemeData _theme = ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white, letterSpacing: 1.4),
        focusColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
    return Theme(
      data: _theme.copyWith(
        colorScheme: _theme.colorScheme.copyWith(
          primary: Colors.amber[700],
          secondary: Colors.amber[700],
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/auths/auth_4.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Opacity(
              opacity: 0.5,
              child: CustomPaint(
                painter: _Background(
                  leftPoint: 0.25,
                  rightPoint: 0.30,
                  midPointWidth: 0.6,
                  midPointHeight: 0.5,
                ),
                child: Container(),
              ),
            ),
            CustomPaint(
              painter: _Background(
                leftPoint: 0.35,
                rightPoint: 0.40,
                midPointWidth: 0.6,
                midPointHeight: 0.5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Login to start!',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 18.0),
                    _form(context),
                    const SizedBox(height: 38.0),
                    _actions(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'email@address.com',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: '********',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 28.0),
        FloatingActionButton.large(
          splashColor: Colors.red,
          onPressed: () {},
          child: const Text(
            'GO',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _actions(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Forget password?'),
        ),
        const SizedBox(width: 24),
        TextButton(
          onPressed: () {},
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}

class _Background extends CustomPainter {
  final double leftPoint;
  final double rightPoint;
  final double midPointWidth;
  final double midPointHeight;

  _Background({
    required this.leftPoint,
    required this.rightPoint,
    required this.midPointWidth,
    required this.midPointHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, size.height * 0.35, size.width, size.height);
    Gradient gradient = const LinearGradient(
      colors: [
        Color(0xffef1385),
        Color(0xfff12280),
        Color(0xfff63d76),
        Color(0xfff84f70),
      ],
      stops: [
        0.2,
        0.4,
        0.6,
        0.8,
      ],
    );

    Paint paint = Paint();
    Path path = Path();
    paint.shader = gradient.createShader(rect);

    path.lineTo(0, size.height * leftPoint); //0.35
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * rightPoint); //0.4
    path.lineTo(size.width * midPointWidth, size.height * midPointHeight);
    path.lineTo(0, size.height * leftPoint);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
