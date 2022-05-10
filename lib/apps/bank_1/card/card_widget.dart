import 'package:flutter/material.dart';
import 'package:flutter_ui/apps/bank_1/card/card_model.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.color,
    required this.model,
  }) : super(key: key);

  final Color color;
  final CardModel model;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12),
      width: size.width * .6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balance',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                model.balance + ' ' + model.currency.toUpperCase(),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          Text(
            model.number,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.expires,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                model.cardType,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
