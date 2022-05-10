enum OperationType {
  income,
  inout,
}

class OperationModel {
  final String avatar;
  final String title;
  final OperationType type;
  final String amount;
  final DateTime date;

  const OperationModel(
    this.avatar,
    this.title,
    this.type,
    this.amount,
    this.date,
  );
}
