import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth3 extends StatefulWidget {
  const Auth3({Key? key}) : super(key: key);

  @override
  _Auth3State createState() => _Auth3State();
}

class _Auth3State extends State<Auth3> {
  final Key _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

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
        colorScheme: _theme.colorScheme.copyWith(
          primary: Colors.black,
          secondary: Colors.orange,
        ),
      ),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.orange,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 38.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In egestas mauris quis ante molestie, eu lobortis massa ullamcorper.",
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    padding: const EdgeInsets.symmetric(
                      vertical: 48.0,
                      horizontal: 24.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(36.0),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'email@address.com',
                              labelText: 'Your Email',
                              hintStyle: TextStyle(
                                color: Color(0xff6b6b6b),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                          ),
                          const SizedBox(height: 28.0),
                          TextFormField(
                            controller: _passwordController,
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
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                          ),
                          const SizedBox(height: 28.0),
                          SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.6,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
