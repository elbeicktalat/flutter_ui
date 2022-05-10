import 'package:flutter/material.dart';
import 'package:flutter_ui/apps/bank_1/card/card_model.dart';
import 'package:flutter_ui/apps/bank_1/transaction/transaction_model.dart';

class Provider {
  final List<Color> cardColors = [
    Colors.deepPurple,
    Colors.blueAccent,
    Colors.orange,
  ];
  final List<CardModel> cardModels = [
    CardModel(
      '26,633.00',
      'USD',
      '**** **** **** 8743',
      'VISA',
      '12/28',
    ),
    CardModel(
      '26,633.00',
      'EUR',
      '**** **** **** 8743',
      'VISA',
      '12/28',
    ),
    CardModel(
      '26,633.00',
      'usd',
      '**** **** **** 8743',
      'MASTER',
      '12/28',
    ),
  ];

  final List<OperationModel> operations = [
    OperationModel(
      'assets/images/profiles/onboarding_1.jpg',
      'Apple store',
      OperationType.inout,
      '3900',
      DateTime.now(),
    ),
    OperationModel(
      'assets/images/profiles/onboarding_1.jpg',
      'Alex',
      OperationType.income,
      '150',
      DateTime.now().add(-const Duration(days: 5)),
    ),
    OperationModel(
      'assets/images/profiles/onboarding_1.jpg',
      'Salary',
      OperationType.income,
      '5000',
      DateTime.now(),
    ),
    OperationModel(
      'assets/images/profiles/onboarding_1.jpg',
      'Sara',
      OperationType.inout,
      '100',
      DateTime.now(),
    ),
  ];
}
