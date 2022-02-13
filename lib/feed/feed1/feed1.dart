import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/feed/feed1/model.dart';
import 'package:flutter_ui/feed/feed1/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Feed1 extends StatefulWidget {
  const Feed1({Key? key}) : super(key: key);

  @override
  _Feed1State createState() => _Feed1State();
}

class _Feed1State extends State<Feed1> {
  final _primaryColor = const Color(0xff9499b3);
  final _secondaryColor = const Color(0xff241432);
  final Feed _provider = Provider.feed();

  final List<Color> _colors = [
    Colors.blue,
    Colors.amber,
    const Color(0xff9499b3),
    const Color(0xff241432),
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
    return Theme(
      data: _theme.copyWith(
        colorScheme: _theme.colorScheme.copyWith(
          primary: _primaryColor,
          secondary: _secondaryColor,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Updates',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_sharp, color: Colors.black),
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: _colors.length,
              reverse: true,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.2,
              ),
              itemBuilder: (context, index) {
                return Align(
                  heightFactor: 0.68,
                  child: _post(context, _colors[index]),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _post(BuildContext context, Color color) {
    Color _contentColor =
        color.computeLuminance() < 0.5 ? Colors.white : Colors.black;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(120.0),
        ),
      ),
      child: Transform.translate(
        offset: Offset(0, size.height * 0.15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: ExactAssetImage(_provider.user.avatar),
                  ),
                  const SizedBox(width: 18.0),
                  Text(
                    _provider.user.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: _contentColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Text(
                _provider.body,
                style: TextStyle(color: _contentColor),
              ),
              const SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        _provider.comments.toString(),
                        style: TextStyle(color: _contentColor),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:
                            Icon(Icons.messenger_outline, color: _contentColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        _provider.loves.toString(),
                        style: TextStyle(color: _contentColor),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.heart, color: _contentColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
