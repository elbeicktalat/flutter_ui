import 'package:flutter/material.dart';
import 'package:flutter_ui/chats/chat1/tabs/groups.dart';
import 'package:flutter_ui/chats/chat1/tabs/history.dart';
import 'package:flutter_ui/chats/chat1/tabs/inbox.dart';
import 'package:flutter_ui/chats/chat1/tabs/online.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat1 extends StatefulWidget {
  const Chat1({Key? key}) : super(key: key);

  @override
  _Chat1State createState() => _Chat1State();
}

class _Chat1State extends State<Chat1> with SingleTickerProviderStateMixin {
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
    ThemeData theme = ThemeData();

    return Theme(
      data: ThemeData(
        colorScheme: theme.colorScheme.copyWith(
          secondary: const Color(0xffef1385),
        ),
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          CustomPaint(
            painter: _ChatBackground(),
            size: const Size(double.infinity, double.infinity),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left, size: 32),
              ),
              title: const Text(
                'MASSAGES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              centerTitle: true,
            ),
            body: _bodyContainer(context),
          ),
        ],
      ),
    );
  }

  Widget _bodyContainer(BuildContext context) {
    return Column(
      children: [
        _tabBarContent(context),
      ],
    );
  }

  Widget _tabBarContent(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            indicatorWeight: 4.0,
            indicator: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            tabs: const [
              Tab(
                text: 'Inbox',
              ),
              Tab(
                text: 'Groups',
              ),
              Tab(
                text: 'Online',
              ),
              Tab(
                text: 'History',
              ),
            ],
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [
                Inbox(),
                const Groups(),
                const Online(),
                const History(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 0.75);
    Gradient gradient = const LinearGradient(
      colors: [
        Color(0xffef1385),
        Color(0xfff12280),
        Color(0xfff63d76),
        Color(0xfff84f70),
      ],
      stops: [
        0.2,
        0.4,
        0.6,
        0.8,
      ],
    );

    Paint paint = Paint();
    Path path = Path();
    paint.shader = gradient.createShader(rect);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.75, 0, size.height * 0.3);
    path.lineTo(0, size.height * 0.3);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
