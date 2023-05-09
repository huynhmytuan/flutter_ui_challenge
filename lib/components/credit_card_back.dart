import 'package:flutter/material.dart';
import 'package:ui_challenge/common/assets.dart';
import 'package:ui_challenge/common/style_constrains.dart';
import 'package:ui_challenge/models/credit_card_info.dart';

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({
    Key? key,
    required this.cardInfo,
  }) : super(key: key);

  final CreditCardInfo cardInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 34,
            width: double.infinity,
            child: ColoredBox(color: Colors.black87),
          ),
          kGapH16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ColoredBox(
                color: Colors.grey,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cardInfo.cvvCode.toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(Assets.images.visaLogo, width: 50),
            ),
          ),
        ],
      ),
    );
  }
}
