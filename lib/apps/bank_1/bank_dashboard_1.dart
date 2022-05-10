import 'package:flutter/material.dart';
import 'package:flutter_ui/apps/bank_1/card/card_widget.dart';
import 'package:flutter_ui/apps/bank_1/transaction/transaction_widget.dart';
import 'package:flutter_ui/apps/bank_1/provider.dart';
import 'dart:math' as math;

class BankDashboard1 extends StatefulWidget {
  const BankDashboard1({Key? key}) : super(key: key);

  @override
  State<BankDashboard1> createState() => _BankDashboard1State();
}

class _BankDashboard1State extends State<BankDashboard1> {
  final Provider provider = Provider();
  double tweenEndValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width * .65,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff5177DF),
                  Color(0xff3E8FE5),
                  Color(0xff32A0EC),
                ],
              ),
            ),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.only(top: size.height * .25),
                physics: const BouncingScrollPhysics(),
                children: [
                  _listTile(Icons.history, 'History'),
                  _listTile(
                    Icons.notifications_active_outlined,
                    'Notifications',
                  ),
                  _listTile(Icons.settings_outlined, 'Settings'),
                  _listTile(Icons.person_outline, 'Profile'),
                  _listTile(Icons.logout, 'Logout'),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: tweenEndValue),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, double value, Widget? child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, size.width * .65 * value)
                  ..rotateY((math.pi / 6) * value),
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        setState(() {
                          tweenEndValue == 0
                              ? tweenEndValue = 1
                              : tweenEndValue = 0;
                        });
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    actions: [
                      Container(
                        width: 40,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: ExactAssetImage(
                              'assets/images/profiles/me.jpg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: Column(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                'My Cards',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: provider.cardModels.length,
                                padding: const EdgeInsets.all(12),
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return CreditCard(
                                    color: provider.cardColors[index],
                                    model: provider.cardModels[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(width: 18);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 18.0,
                              ),
                              child: Text(
                                'Transactions',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: provider.operations.length,
                                padding: const EdgeInsets.all(18),
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return OperationWidget(
                                    isFirst: index == 0 ? true : false,
                                    isLast: index ==
                                        provider.operations.length - 1,
                                    model: provider.operations[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            width: tweenEndValue == 0 ? size.width * .05 : size.width,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  setState(() {
                    tweenEndValue = 1;
                  });
                } else {
                  setState(() {
                    tweenEndValue = 0;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTile(IconData icon, String title) {
    return ListTile(
      onTap: () {},
      iconColor: Colors.white,
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
