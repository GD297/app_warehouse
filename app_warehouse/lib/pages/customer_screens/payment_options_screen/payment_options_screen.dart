import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/pages/customer_screens/payment_options_screen/credit_cart_expandable.dart';
import 'package:app_warehouse/pages/customer_screens/payment_options_screen/wallet_expandable.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: CustomColor.black,
            useInkWell: true,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAppBar(
                isHome: false,
              ),
              Text(
                "WAFAYU GUARANTEE",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                    fontWeight: FontWeight.w100),
              ),
              WalletExpandable(),
              CreditCardExpandable(),
            ],
          ),
        ),
      ),
    );
  }
}
