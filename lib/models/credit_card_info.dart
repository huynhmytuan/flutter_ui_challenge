// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreditCardInfo {
  const CreditCardInfo({
    required this.cardNumber,
    required this.cardHolder,
    required this.bankName,
    required this.expiryDate,
    required this.validFrom,
    required this.cvvCode,
  });

  final int cardNumber;
  final String cardHolder;
  final String bankName;
  final DateTime expiryDate;
  final DateTime validFrom;
  final int cvvCode;
}
