import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile8/provider.dart';
import 'package:flutter_ui/profiles/profile8/user.dart';

class Profile8 extends StatefulWidget {
  const Profile8({Key? key}) : super(key: key);

  @override
  _Profile8State createState() => _Profile8State();
}

class _Profile8State extends State<Profile8> with TickerProviderStateMixin {
  final Profile _profile = Provider.profile();
  final Provider _provider = Provider();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.grey[800],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.grey[800],
          ),
        ],
      ),
      body: _bodyContainer(context),
    );
  }

  Widget _bodyContainer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _header(context),
        _tabBarContent(context),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _profileImage(context),
        const SizedBox(height: 16.0),
        ..._profileText(),
        const SizedBox(height: 16.0),
        _followButton(),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _profileImage(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
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
      const SizedBox(height: 6.0),
      Text(
        _profile.user!.profession!,
        style: const TextStyle(color: Colors.grey),
      ),
    ];
  }

  Widget _followButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'FOLLOW',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepOrange[800]),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24.0),
        ),
      ),
    );
  }

  Widget _tabBarContent(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(width: 1.0, color: Colors.grey.shade200),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.grey[800],
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 4.0,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 28.0),
              indicatorColor: Colors.deepOrange[800],
              tabs: const [
                Tab(
                  text: 'PHOTO',
                ),
                Tab(
                  text: 'VIDEOS',
                ),
                Tab(
                  text: 'POSTS',
                ),
                Tab(
                  text: 'FRIENDS',
                ),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [
                _photos(context),
                _videos(context),
                _posts(context),
                _friends(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _photos(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: _provider.photos().map((photo) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage(photo),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      }).toList(),
    );
  }

  Widget _videos(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: _provider.videos().map((video) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage(video),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      }).toList(),
    );
  }

  Widget _posts(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: _provider.posts().map((post) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage(post),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      }).toList(),
    );
  }

  Widget _friends(BuildContext context) {
    return Column(
      children: [
        _statistic(),
        const Divider(),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(8.0),
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: _provider.friends().map((friend) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(friend),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              );
            }).toList(),
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
}
