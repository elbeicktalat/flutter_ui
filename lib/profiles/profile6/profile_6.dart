import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile6/provider.dart';
import 'package:flutter_ui/profiles/profile6/user.dart';

class Profile6 extends StatefulWidget {
  const Profile6({Key? key}) : super(key: key);

  @override
  _Profile6State createState() => _Profile6State();
}

class _Profile6State extends State<Profile6> {
  final Profile _profile = Provider.profile();
  final int _photosCount = 25;
  final TextStyle _sectionTextStyle = TextStyle(
    color: Colors.grey[700],
    letterSpacing: 1.2,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'PROFILE',
          style: TextStyle(
            color: Colors.grey.shade800,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.grey.shade800,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.grey.shade800,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            const SizedBox(height: 18.0),
            _photos(context),
            const SizedBox(height: 28.0),
            _statistic(),
            const SizedBox(height: 28.0),
            _aboutMe(),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _profileImage(context),
              _actionButtons(context),
            ],
          ),
          const SizedBox(height: 28.0),
          Text(
            _profile.user!.name!,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28.0,
              color: Colors.grey[800],
            ),
          ),
          Text(
            _profile.user!.profession!,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: ExactAssetImage('assets/images/profiles/me.jpg'),
        ),
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
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
}
