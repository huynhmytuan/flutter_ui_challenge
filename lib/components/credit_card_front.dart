// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ui_challenge/common/assets.dart';
import 'package:ui_challenge/common/style_constrains.dart';
import 'package:ui_challenge/models/credit_card_info.dart';
import 'package:ui_challenge/utils/extentions/datetime_ext.dart';
import 'package:ui_challenge/utils/extentions/int_ext.dart';

class CreditCardFront extends StatelessWidget {
  const CreditCardFront({
    super.key,
    required this.cardInfo,
  });

  final CreditCardInfo cardInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BankNameWidget(bankName: cardInfo.bankName),
          kGapH8,
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(Assets.images.chip, width: 50),
          ),
          kGapH8,
          _CardNumber(number: cardInfo.cardNumber),
          kGapH8,
          Row(
            children: [
              _DateWidget(label: 'VALID\nFROM', date: cardInfo.expiryDate),
              kGapW24,
              _DateWidget(label: 'EXPIRES\nEND', date: cardInfo.validFrom),
            ],
          ),
          kGapH8,
          Row(
            children: [
              _CardHolderWidget(name: cardInfo.cardHolder),
              const Spacer(),
              Image.asset(Assets.images.visaLogo, width: 50),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardNumber extends StatelessWidget {
  const _CardNumber({
    Key? key,
    required this.number,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Text(
      number.spaceSeparateNumbers(),
      style: const TextStyle(
        fontSize: 20,
        wordSpacing: 4,
        letterSpacing: 2,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class _DateWidget extends StatelessWidget {
  const _DateWidget({
    Key? key,
    required this.label,
    required this.date,
  }) : super(key: key);
  final String label;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 6),
        ),
        kGapW8,
        Text(
          date.toMonthYearString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _CardHolderWidget extends StatelessWidget {
  const _CardHolderWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name.toUpperCase());
  }
}

class _BankNameWidget extends StatelessWidget {
  const _BankNameWidget({
    Key? key,
    required this.bankName,
  }) : super(key: key);

  final String bankName;

  @override
  Widget build(BuildContext context) {
    return Text(
      bankName,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
