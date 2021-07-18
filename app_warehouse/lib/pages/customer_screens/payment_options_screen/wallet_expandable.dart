import 'package:flutter/material.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/payment_options_screen/wallet_radio_button.dart';
import 'package:expandable/expandable.dart';

class WalletExpandable extends StatelessWidget {
  Function changePayment;
  WalletExpandable({this.changePayment});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
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
                header: Padding(
                  padding: EdgeInsets.fromLTRB(10, 13, 10, 13),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/wallet-payment.png",
                        height: 20,
                        width: 20,
                      ),
                      CustomSizedBox(
                        context: context,
                        width: 12,
                      ),
                      CustomText(
                          text: "Wallet",
                          color: CustomColor.black,
                          context: context,
                          fontSize: 16)
                    ],
                  ),
                ),
                collapsed: null,
                expanded: Column(
                  children: <Widget>[
                    WalletRadioButton(changePayment: changePayment)
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
    );
  }
}
