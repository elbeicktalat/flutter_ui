import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth6 extends StatefulWidget {
  const Auth6({Key? key}) : super(key: key);

  @override
  State<Auth6> createState() => _Auth6State();
}

class _Auth6State extends State<Auth6> {
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
    Size size = MediaQuery.of(context).size;
    ThemeData _theme = ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white, letterSpacing: 1.4),
        prefixIconColor: Colors.white,
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
      data: _theme.copyWith(
        colorScheme: _theme.colorScheme.copyWith(
          primary: Colors.orange,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
          child: Stack(
            children: [
              CustomPaint(
                painter: _Circles(),
                child: Container(),
              ),
              CustomPaint(
                painter: _Circles(
                  count: 2,
                  offset: Offset(-size.width * 0.25, size.height * 0.8),
                ),
                child: Container(),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Welcome back to',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          'Custom Paint',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.4,
                                  ),
                        ),
                      ],
                    ),
                    _form(context),
                    _actions(context),
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
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'email@address.com',
                prefixIconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
                hintText: '********',
                prefixIconColor: Colors.white,
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
    return Row(
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
    );
  }
}

class _Circles extends CustomPainter {
  final Offset? offset;
  final int? count;

  _Circles({
    this.offset,
    this.count,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient1 = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFF35D2D),
        Color(0xFFFC4692),
      ],
      stops: [
        0.0,
        0.3,
      ],
    );

    Gradient gradient2 = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFF67045),
        Color(0xFFF5578E),
      ],
      stops: [
        0.0,
        0.8,
      ],
    );

    Gradient gradient3 = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFFF8A64),
        Color(0xFFFF65A5),
      ],
      stops: [
        0.0,
        0.3,
      ],
    );

    Offset offset = Offset(size.width - (size.width * 0.1), size.height * 0.1);
    if (count == 2) {
      drawCircle(canvas, size, 350, gradient2, this.offset ?? offset);
      drawCircle(canvas, size, 200, gradient3, this.offset ?? offset);
    } else {
      drawCircle(canvas, size, 500, gradient1, this.offset ?? offset);
      drawCircle(canvas, size, 350, gradient2, this.offset ?? offset);
      drawCircle(canvas, size, 200, gradient3, this.offset ?? offset);
    }
  }

  void drawCircle(
    Canvas canvas,
    Size size,
    double circleSize,
    Gradient gradient,
    Offset offset,
  ) {
    Path path = Path();
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint paint = Paint();
    paint.shader = gradient.createShader(rect);
    Rect shadowRect = Rect.fromCircle(center: offset, radius: circleSize + 5);
    path.addOval(shadowRect);
    canvas.drawShadow(path, Colors.black.withOpacity(0.4), 6, true);
    canvas.drawCircle(offset, circleSize, paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
