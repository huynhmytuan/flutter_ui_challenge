import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_challenge/components/credit_card_back.dart';
import 'package:ui_challenge/components/credit_card_front.dart';
import 'package:ui_challenge/models/credit_card_info.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key, required this.cardInfo});

  final CreditCardInfo cardInfo;

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _flipAnimationController;
  late Animation _flipAnimation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _flipAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 410),
    );
    _flipAnimation =
        Tween(end: 1.0, begin: 0.0).animate(_flipAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            _status = status;
          });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_status == AnimationStatus.dismissed) {
          _flipAnimationController.forward();
        } else {
          _flipAnimationController.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, _) => Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0015)
            ..rotateY(math.pi * _flipAnimation.value),
          child: Container(
            width: 320,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.purple,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.white,
              ),
              child: _flipAnimation.value <= 0.5
                  ? CreditCardFront(
                      cardInfo: widget.cardInfo,
                    )
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: CreditCardBack(
                        cardInfo: widget.cardInfo,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
