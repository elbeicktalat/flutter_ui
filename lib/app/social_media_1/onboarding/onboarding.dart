import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:flutter_ui/app/social_media_1/colors.dart';
import 'package:flutter_ui/app/social_media_1/profile/profile.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightPink,
      appBar: AppBar(
        backgroundColor: AppColors.lightPink,
        elevation: 0,
      ),
      body: CustomPaint(
        painter: PinkBackground(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'The best photos from good people',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: AppColors.darkForeground,
                        ),
                  ),
                  const SizedBox(height: 32),
                  const PageViewIndicator(
                    length: 4,
                    currentIndex: 1,
                    currentColor: AppColors.darkPink,
                    currentSize: 8.0,
                    otherSize: 8.0,
                    otherColor: Color(0xffEEE2E6),
                    alignment: MainAxisAlignment.start,
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(0, size.height * .05),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: Image.asset(
                        'assets/images/app/social_media_1/flower.png',
                        fit: BoxFit.cover,
                        width: size.width * .7,
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 28),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  child: Container(
                    width: size.width * .75,
                    height: size.height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        transform: GradientRotation(24),
                        colors: [
                          AppColors.orange,
                          Color(0xffBFA0C0),
                          AppColors.sky,
                        ],
                        stops: [
                          0.35,
                          0.55,
                          0.7,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                        ),
                        const SizedBox(width: 24),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 28,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PinkBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = AppColors.pink;
    path.lineTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      0,
      size.height * .25,
      size.width * .3,
      size.height * .25,
    );
    path.lineTo(size.width * .7, size.height * 0.25);
    path.quadraticBezierTo(
      size.width,
      size.height * .25,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
