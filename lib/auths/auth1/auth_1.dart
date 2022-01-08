import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth1 extends StatefulWidget {
  const Auth1({Key? key}) : super(key: key);

  @override
  _Auth1State createState() => _Auth1State();
}

class _Auth1State extends State<Auth1> {
  final Key _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final Color _yellowColor = const Color(0xfff7c41c);

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
    return Theme(
      data: _theme.copyWith(
        colorScheme: _theme.colorScheme.copyWith(primary: _yellowColor),
      ),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/auths/auth_1.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Sign in to your account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28.0),
                  Column(
                    children: [
                      _form(context),
                      const SizedBox(height: 48.0),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 6.0),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Crate one.',
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      decoration: BoxDecoration(
        color: const Color(0xff121212),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'email@address.com',
                      labelText: 'Your Email',
                      hintStyle: TextStyle(
                        color: Color(0xff6b6b6b),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6b6b6b)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: '*********',
                      hintStyle: TextStyle(
                        color: Color(0xff6b6b6b),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6b6b6b)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buttonsAction(context),
        ],
      ),
    );
  }

  Widget _buttonsAction(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform.translate(
          offset: const Offset(24, 0),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(_yellowColor),
            ),
            child: const Text('Forget Password?'),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 150.0,
            height: 55.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _yellowColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(32.0),
                topLeft: Radius.circular(24.0),
                bottomLeft: Radius.circular(24.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.0),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
