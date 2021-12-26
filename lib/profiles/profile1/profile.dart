import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile1/provider.dart';
import 'package:flutter_ui/profiles/profile1/user.dart';

class Profile1 extends StatefulWidget {
  const Profile1({Key? key}) : super(key: key);

  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  final Color _textColor = const Color(0xff4e4e4e);
  final Profile _profile = Provider.profile();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          ClipPath(
            clipper: HeaderClipper(),
            child: Image.asset(
              'assets/images/profiles/profile_1.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            body: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.18,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _header(),
                      const SizedBox(height: 24),
                      _body(),
                    ],
                  ),
                  _bottomBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          maxRadius: 40.0,
          backgroundImage: ExactAssetImage(
            'assets/images/profiles/me.jpg',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _profile.user!.name!,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: _textColor,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.grey,
            ),
            Text(_profile.user!.address!)
          ],
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT ME',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          _profile.user!.about!,
          style: TextStyle(
            color: _textColor,
            fontSize: 18,
            height: 1.4,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }

  Widget _bottomBar() {
    TextStyle _titleStyle = TextStyle(
      color: Colors.grey[400],
      fontSize: 18,
      letterSpacing: 1,
    );
    TextStyle _subTitleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: _textColor,
      letterSpacing: 1.2,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Followers',
                style: _titleStyle,
              ),
              const SizedBox(height: 6),
              Text(
                _profile.followers.toString(),
                style: _subTitleStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Following',
                style: _titleStyle,
              ),
              const SizedBox(height: 6),
              Text(
                _profile.following.toString(),
                style: _subTitleStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Friends',
                style: _titleStyle,
              ),
              const SizedBox(height: 6),
              Text(
                _profile.friends.toString(),
                style: _subTitleStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.85);
    path.lineTo(0, size.height * 0.75);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}