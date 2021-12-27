import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile2/provider.dart';
import 'package:flutter_ui/profiles/profile2/user.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  final Profile _profile = Provider.profile();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/profiles/profile_2.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      _header(),
                      _bodyContent(context, _profile),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text('FRIENDS', style: _titleStyle),
                ),
                _friends(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final TextStyle _titleStyle = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
    letterSpacing: 1.2,
  );

  Widget _bodyContent(BuildContext context, Profile _profile) {
    final TextStyle _subTitleStyle = TextStyle(
      color: Colors.grey[700],
      fontSize: 24,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.6,
    );
    final TextStyle _sectionStyle = TextStyle(
      color: Colors.grey[700],
      letterSpacing: 1.2,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'FOLLOWERS',
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
                  'FOLLOWING',
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
                  'FRIENDS',
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
        const Divider(height: 24),
        Text(
          'ABOUT ME',
          style: _sectionStyle,
        ),
        const SizedBox(height: 16),
        Text(
          _profile.user!.about!,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18,
            letterSpacing: 1.2,
            height: 1.4,
          ),
          maxLines: 6,
        ),
      ],
    );
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundImage: ExactAssetImage(
                  'assets/images/profiles/me.jpg',
                ),
                maxRadius: 40,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            _profile.user!.name!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              const SizedBox(width: 6.0),
              Text(
                _profile.user!.address!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _friends() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(25, (index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.25,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: ExactAssetImage('assets/images/profiles/me.jpg'),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
