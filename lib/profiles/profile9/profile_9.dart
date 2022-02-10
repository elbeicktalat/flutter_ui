import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile9/provider.dart';
import 'package:flutter_ui/profiles/profile9/user.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile9 extends StatefulWidget {
  const Profile9({Key? key}) : super(key: key);

  @override
  _Profile9State createState() => _Profile9State();
}

class _Profile9State extends State<Profile9> {
  final Profile _profile = Provider.profile();
  final double _borderRadius = 45.0;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );

    return Theme(
      data: _theme,
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.grey.shade800),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.list, color: Colors.grey.shade800),
            ),
          ],
        ),
        body: Stack(
          children: [
            ..._statistic(),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(_borderRadius),
                    bottomRight: Radius.circular(_borderRadius),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                              ExactAssetImage('assets/images/profiles/me.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28.0),
                    Text(
                      _profile.user!.name!,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _profile.user!.address!,
                      style: const TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.pink,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  List<Widget> _statistic() {
    TextStyle _titleStyle = TextStyle(
      fontSize: 14,
      color: Colors.white.withOpacity(0.5),
      letterSpacing: 1.2,
    );

    const TextStyle _subTitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.6,
    );
    return [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.25,
        left: 0,
        right: 0,
        child: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.16,
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(_borderRadius),
              bottomRight: Radius.circular(_borderRadius),
            ),
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.32,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    _profile.followers.toString(),
                    style: _subTitleStyle,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'FOLLOWERS',
                    style: _titleStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    _profile.following.toString(),
                    style: _subTitleStyle,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'FOLLOWING',
                    style: _titleStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    _profile.likes.toString(),
                    style: _subTitleStyle,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'FRIENDS',
                    style: _titleStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ];
  }
}
