import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth2 extends StatefulWidget {
  const Auth2({Key? key}) : super(key: key);

  @override
  _Auth2State createState() => _Auth2State();
}

class _Auth2State extends State<Auth2> {
  final Key _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final Color _primaryColor = const Color(0xff9bd609);

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
        colorScheme: _theme.colorScheme.copyWith(primary: _primaryColor),
      ),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/auths/auth_2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 100.0),
                  _form(context),
                  const SizedBox(height: 28.0),
                  _buttonsAction(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
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
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 24.0),
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
                    color: Colors.white,
                    letterSpacing: 8.0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
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
      ],
    );
  }

  Widget _buttonsAction(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 175.0,
            height: 55.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
                bottomLeft: Radius.circular(32.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'LOGIN',
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
        const SizedBox(height: 38.0),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('Forget Password?'),
        ),
        const SizedBox(height: 12.0),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('Don\'t have an account?'),
        ),
      ],
    );
  }
}
