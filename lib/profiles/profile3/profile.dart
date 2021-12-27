import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile3/provider.dart';
import 'package:flutter_ui/profiles/profile3/user.dart';

class Profile3 extends StatefulWidget {
  const Profile3({Key? key}) : super(key: key);

  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  final Profile _profile = Provider.profile();

  final TextStyle _sectionTextStyle = TextStyle(
    color: Colors.grey[700],
    letterSpacing: 1.2,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  final int _photosCount = 25;
  final int _friendsCount = 25;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/profiles/profile_3.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          body: Stack(
            children: [
              _bodyContainer(context),
              _profileImage(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bodyContainer(BuildContext context) {
    return Positioned(
      left: 16.0,
      right: 16.0,
      top: MediaQuery.of(context).size.height * 0.07,
      bottom: 0.0,
      child: Container(
        padding: const EdgeInsets.only(top: 75.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18.0),
            topLeft: Radius.circular(18.0),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          children: [
            Text(
              _profile.user!.name!,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28.0,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              _profile.user!.address!,
              style: TextStyle(
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18.0),
            _followButton(context),
            const Divider(),
            _statistic(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'PHOTOS ($_photosCount)',
                style: _sectionTextStyle,
              ),
            ),
            _photos(context),
            const Divider(height: 28.0),
            _aboutMe(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'FRIENDS ($_friendsCount)',
                style: _sectionTextStyle,
              ),
            ),
            _friends(context)
          ],
        ),
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2 - 50,
      right: MediaQuery.of(context).size.width / 2 - 50,
      top: MediaQuery.of(context).size.height * 0.07 - 50,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: ExactAssetImage('assets/images/profiles/me.jpg'),
          ),
        ),
      ),
    );
  }

  Widget _followButton(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'FOLLOW',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 18.0),
          ),
        ),
      ),
    );
  }

  Widget _statistic() {
    const TextStyle _titleStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey,
      letterSpacing: 1.2,
    );

    final TextStyle _subTitleStyle = TextStyle(
      color: Colors.grey[700],
      fontSize: 24,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.6,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
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
              const Text(
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
              const Text(
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
    );
  }

  Widget _photos(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(_photosCount, (index) {
          return Container(
            width: 100,
            margin: (index == 0)
                ? const EdgeInsets.only(left: 16.0, right: 8.0)
                : (index == _photosCount - 1)
                    ? const EdgeInsets.only(left: 8.0, right: 16.0)
                    : const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/images/profiles/profile_1.jpg'),
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _aboutMe() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: _sectionTextStyle,
          ),
          const SizedBox(height: 18.0),
          Text(
            _profile.user!.about!,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
              letterSpacing: 1.2,
              height: 1.4,
            ),
          )
        ],
      ),
    );
  }

  Widget _friends(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(_friendsCount, (index) {
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
