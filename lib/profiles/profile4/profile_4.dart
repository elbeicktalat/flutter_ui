import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile4/provider.dart';
import 'package:flutter_ui/profiles/profile4/user.dart';

class Profile4 extends StatefulWidget {
  const Profile4({Key? key}) : super(key: key);

  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  final Profile _profile = Provider.profile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/profiles/profile_4.jpg',
          fit: BoxFit.cover,
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
          body: Align(
            alignment: Alignment.bottomCenter,
            child: _bodyCard(context),
          ),
        ),
      ],
    );
  }

  Widget _bodyCard(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(context),
                  _actionButtons(context),
                ],
              ),
              const SizedBox(height: 18.0),
              ..._profileText(),
            ],
          ),
          _statistic(),
        ],
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
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
        const SizedBox(width: 8.0),
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

  List<Widget> _profileText() {
    return [
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
      const SizedBox(height: 18.0),
      Text(
        _profile.user!.about!,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 18,
          letterSpacing: 1.2,
          height: 1.4,
        ),
      ),
    ];
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
