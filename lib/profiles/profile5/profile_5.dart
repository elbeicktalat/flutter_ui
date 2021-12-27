import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:flutter_ui/profiles/profile5/provider.dart';
import 'package:flutter_ui/profiles/profile5/user.dart';

class Profile5 extends StatefulWidget {
  const Profile5({Key? key}) : super(key: key);

  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5> {
  final Profile _profile = Provider.profile();
  PageController? _pageController;
  int currentIndex = 0;

  final TextStyle _sectionTextStyle = TextStyle(
    color: Colors.grey[700],
    letterSpacing: 1.2,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _pageView(context),
          _bodyContent(context),
        ],
      ),
    );
  }

  Widget _pageView(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.65,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                'assets/images/profiles/onboarding_${index + 1}.jpg',
                fit: BoxFit.cover,
              );
            },
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Transform.translate(
            offset: const Offset(0, 500),
            child: PageViewIndicator(
              length: 3,
              currentIndex: currentIndex,
              currentColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _profileContent(context),
            _friends(context),
          ],
        ),
      ),
    );
  }

  Widget _profileContent(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _profileImage(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._userText(),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'FOLLOW',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade800),
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
        ),
        const SizedBox(height: 16.0),
        Text(
          _profile.user!.about!,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18,
            letterSpacing: 1.2,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _profileImage(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: ExactAssetImage('assets/images/profiles/me.jpg'),
        ),
      ),
    );
  }

  List<Widget> _userText() {
    return [
      Text(
        _profile.user!.name!,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 24.0,
          color: Colors.grey[800],
        ),
      ),
      Text(
        _profile.user!.profession!,
        style: const TextStyle(color: Colors.grey),
      ),
    ];
  }

  Widget _friends(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.50,
            child: Stack(
              children: List.generate(3, (index) {
                return Positioned(
                  left: index * 35,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/profiles/me.jpg'),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Text(
            '+37 mutual friends',
            style: _sectionTextStyle,
          ),
        ],
      ),
    );
  }
}
