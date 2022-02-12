import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile10/provider.dart';
import 'package:flutter_ui/profiles/profile10/user.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile10 extends StatefulWidget {
  const Profile10({Key? key}) : super(key: key);

  @override
  _Profile10State createState() => _Profile10State();
}

class _Profile10State extends State<Profile10> {
  final Profile _profile = Provider.profile();
  final double _borderRadius = 45.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/profiles/onboarding_1.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.45,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: ExactAssetImage(_profile.user!.avatar!),
                          ),
                        ),
                      ),
                      Text(
                        _profile.user!.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        _profile.user!.address!.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.65,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_borderRadius),
                      topRight: Radius.circular(_borderRadius),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Photos & Videos',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          '${_profile.shots} shots',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: ExactAssetImage(
                                    'assets/images/profiles/onboarding_1.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(_borderRadius),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: MediaQuery.of(context).size.height * 0.50,
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: ExactAssetImage(
                                        'assets/images/profiles/onboarding_3.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(_borderRadius),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                ),
                                const SizedBox(height: 24.0),
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: ExactAssetImage(
                                        'assets/images/profiles/profile_1.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(_borderRadius),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
