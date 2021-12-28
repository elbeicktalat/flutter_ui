import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile7/provider.dart';
import 'package:flutter_ui/profiles/profile7/user.dart';

class Profile7 extends StatefulWidget {
  const Profile7({Key? key}) : super(key: key);

  @override
  _Profile7State createState() => _Profile7State();
}

class _Profile7State extends State<Profile7> {
  final Profile _profile = Provider.profile();
  final int _imagesCount = 12;
  final TextStyle _sectionTextStyle = TextStyle(
    color: Colors.grey[700],
    letterSpacing: 1.2,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/profiles/profile_7.jpg',
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          fit: BoxFit.cover,
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
          body: _bodyContainer(context),
        ),
        _profileImage(context),
      ],
    );
  }

  Widget _bodyContainer(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.75,
        color: Colors.white,
        padding: const EdgeInsets.only(top: 75.0),
        child: ListView(
          children: [
            _header(context),
            const SizedBox(height: 16.0),
            _actionButtons(context),
            const SizedBox(height: 16.0),
            const Divider(),
            _statistic(),
            const Divider(),
            _about(),
            const SizedBox(height: 16.0),
            _photos(),
          ],
        ),
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: MediaQuery.of(context).size.height * 0.25 - 50,
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

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Text(
          _profile.user!.name!,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 28.0,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 6.0),
        Text(
          _profile.user!.profession!,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'ADD FRIEND',
            style: TextStyle(color: Colors.grey[800]),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.grey.shade200),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade800, width: 1.0),
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 18.0),
            ),
          ),
        ),
        const SizedBox(width: 18.0),
        TextButton(
          onPressed: () {},
          child: const Text(
            'FOLLOW',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
            overlayColor: MaterialStateProperty.all(Colors.grey),
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
      ],
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
      padding: const EdgeInsets.all(18.0),
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

  Widget _about() {
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

  Widget _photos() {
    const double gridSpace = 8.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PHOTOS', style: _sectionTextStyle),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            height: (_imagesCount / 3 * 100) + (gridSpace * 10.0),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: gridSpace,
              crossAxisSpacing: gridSpace,
              children: List.generate(_imagesCount, (index) {
                return Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(
                        'assets/images/profiles/profile_1.jpg',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
