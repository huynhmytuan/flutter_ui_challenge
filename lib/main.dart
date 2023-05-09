import 'package:flutter/material.dart';
import 'package:ui_challenge/components/credit_card.dart';
import 'package:ui_challenge/models/credit_card_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flip Credit Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
      ),
      home: const MyHomePage(title: 'Flip Credit Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final validFrom = today;
    final expiryDate = DateTime(today.year + 4, today.month, today.day);
    final cardInfo = CreditCardInfo(
      cardNumber: 9720901265879102,
      cardHolder: 'HUYNH MY TUAN',
      bankName: 'ASIA BANK',
      expiryDate: expiryDate,
      validFrom: validFrom,
      cvvCode: 123,
    );

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: CreditCard(
          cardInfo: cardInfo,
        ),
      ),
    );
  }
}
