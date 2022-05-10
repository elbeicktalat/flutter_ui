class CardModel {
  final String cardType;
  final String balance;
  final String currency;
  final String number;
  final String expires;

  CardModel(
    this.balance,
    this.currency,
    this.number,
    this.cardType,
    this.expires,
  );
}
