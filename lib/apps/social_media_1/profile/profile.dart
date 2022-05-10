import 'package:flutter/material.dart';
import 'package:flutter_ui/apps/social_media_1/colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightPink,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightPink,
        foregroundColor: AppColors.darkForeground,
        iconTheme: const IconThemeData(size: 28),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Profile',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: AppColors.darkForeground,
                        letterSpacing: 1.2,
                      ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 18),
                              spreadRadius: 4,
                              blurRadius: 35,
                              color: AppColors.pink,
                            )
                          ],
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 64,
                          color: AppColors.darkPink,
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'Sara rossi'.toUpperCase(),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: AppColors.darkForeground,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        '@sara',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: AppColors.foreground,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * .5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(color: Colors.white),
          ),
          CustomPaint(
            painter: PinkBackground(),
            child: Transform.translate(
              offset: Offset(0, size.height * .05),
              child: SizedBox(
                height: double.maxFinite,
                child: _infoRow(size),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _infoColumn('Photos', 567),
          _infoColumn('Followers', 1255),
          _infoColumn('Following', 80),
        ],
      ),
    );
  }

  _infoColumn(String title, int amount) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.foreground,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          amount.toString(),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.darkForeground,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
        ),
      ],
    );
  }
}

class PinkBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = const Color(0xffFCEEF0);
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      0,
      size.height * .45,
      size.width * .35,
      size.height * .45,
    );
    path.lineTo(size.width * .7, size.height * 0.45);
    path.quadraticBezierTo(
      size.width,
      size.height * .45,
      size.width,
      size.height * .25,
    );
    path.lineTo(size.width, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * .95,
      size.height * .65,
      size.width * .75,
      size.height * .65,
    );
    path.lineTo(size.width * .25, size.height * 0.65);
    path.quadraticBezierTo(
      0,
      size.height * .65,
      0,
      size.height * .8,
    );
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
