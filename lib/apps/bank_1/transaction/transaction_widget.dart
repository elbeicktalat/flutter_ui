import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/apps/bank_1/transaction/transaction_model.dart';

class OperationWidget extends StatelessWidget {
  const OperationWidget({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.model,
  }) : super(key: key);

  final bool isFirst;
  final bool isLast;
  final OperationModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: BorderDirectional(
          top: const BorderSide(color: Colors.grey),
          start: const BorderSide(color: Colors.grey),
          end: const BorderSide(color: Colors.grey),
          bottom:
              isLast ? const BorderSide(color: Colors.grey) : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: ExactAssetImage(model.avatar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${model.date.day}/${model.date.month}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              model.type == OperationType.income
                  ? "+" + model.amount
                  : "-" + model.amount,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: model.type == OperationType.income
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 24,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
