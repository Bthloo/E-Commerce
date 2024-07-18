import 'package:flutter/material.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../../../../core/models/ProfileResponseModel.dart';
import '../components/profile_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
static const String routeName = 'payment-screen';
  @override
  Widget build(BuildContext context) {
    PaymentMethodArgument argument = ModalRoute.of(context)!.settings.arguments as PaymentMethodArgument;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
      ),body: Center(
      child: CreditCardUi(
        currencySymbol: "\$ ",
        cardProviderLogo: Image.asset("assets/images/app-icon-png.png"),
        cardHolderFullName: argument.name,
        cardNumber: argument.bank.cardNumber.toString(),
        validThru: argument.bank.cardExpire.toString(),
        cardType: CardType.other,
        topLeftColor: Theme.of(context).colorScheme.primary,
        placeNfcIconAtTheEnd: true,
        enableFlipping: true,
        cvvNumber: "***",
        showBalance: true,
        balance: 4500,
        autoHideBalance: true,
      ),
    ),
    );
  }
}
