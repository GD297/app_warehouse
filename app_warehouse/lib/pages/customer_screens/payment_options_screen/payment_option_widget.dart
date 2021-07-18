import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:app_warehouse/pages/customer_screens/payment_options_screen/credit_cart_expandable.dart';

import 'package:app_warehouse/pages/customer_screens/payment_options_screen/wallet_expandable.dart';

enum PaymentOption { BIDV, SACOMBANK, CREDITCARD, DEFAULT }

class CustomPaymentWidget extends StatefulWidget {
  @override
  CustomPaymentWidgetState createState() => CustomPaymentWidgetState();
}

class CustomPaymentWidgetState extends State<CustomPaymentWidget> {
  PaymentOption _payment = PaymentOption.DEFAULT;

  _changePayment(String paymentMethod) {
    switch (paymentMethod) {
      case "BIDV":
        setState(() {
          _payment = PaymentOption.BIDV;
        });
        break;
      case "Sacombank":
        setState(() {
          _payment = PaymentOption.SACOMBANK;
        });
        break;
      case "CreditCard":
        setState(() {
          _payment = PaymentOption.CREDITCARD;
        });
        break;
    }
  }

  Widget _paymentOption() {
    switch (_payment) {
      case PaymentOption.CREDITCARD:
        return Row(
          children: [
            Image.asset(
              "assets/images/master-card.png",
              height: 20,
              width: 20,
            ),
            CustomSizedBox(
              context: context,
              width: 5,
            ),
            CustomText(
                text: "*9846...",
                color: CustomColor.black,
                context: context,
                fontSize: 15)
          ],
        );
      case PaymentOption.SACOMBANK:
        return Row(
          children: [
            Image.asset(
              "assets/images/sacombank.png",
              height: 20,
              width: 20,
            ),
            CustomSizedBox(
              context: context,
              width: 5,
            ),
            CustomText(
                text: "*6694...",
                color: CustomColor.black,
                context: context,
                fontSize: 15)
          ],
        );
      case PaymentOption.BIDV:
        return Row(
          children: [
            Image.asset(
              "assets/images/bidv.png",
              height: 20,
              width: 20,
            ),
            CustomSizedBox(
              context: context,
              width: 5,
            ),
            CustomText(
                text: "*9886...",
                color: CustomColor.black,
                context: context,
                fontSize: 15)
          ],
        );
      default:
        return CustomText(
          text: "Choose your payment",
          color: Colors.black38,
          context: context,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandableNotifier(
            initialExpanded: true,
            child: Card(
              child: Column(
                children: <Widget>[
                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                      ),
                      header: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Payment Option",
                              color: CustomColor.black,
                              context: context,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            _paymentOption(),
                          ],
                        ),
                      ),
                      collapsed: null,
                      expanded: Column(
                        children: <Widget>[
                          WalletExpandable(changePayment: _changePayment),
                          CreditCardExpandable(changePayment: _changePayment),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
