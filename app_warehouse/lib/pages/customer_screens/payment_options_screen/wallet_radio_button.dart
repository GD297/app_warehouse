import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(WalletRadioButton());

/// This Widget is the main application widget.
class WalletRadioButton extends StatelessWidget {
  Function changePayment;
  WalletRadioButton({this.changePayment});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          // When the child is tapped, show a snackbar.
          onTap: () {
            changePayment("BIDV");
          },
          // The custom button
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 19.0),
                  child: Divider(
                    thickness: 0.25,
                    color: Color(0xFF8D8D8D),
                    height: 2,
                  )),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(17, 15, 30, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomSizedBox(
                          context: context,
                          width: 15,
                        ),
                        Image.asset(
                          "assets/images/bidv.png",
                          height: 20,
                          width: 20,
                        ),
                        CustomSizedBox(
                          context: context,
                          width: 12,
                        ),
                        CustomText(
                            text: "BIDV",
                            color: Colors.black38,
                            context: context,
                            fontSize: 15),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: "*9886...",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          // When the child is tapped, show a snackbar.
          onTap: () {
            changePayment("Sacombank");
          },
          // The custom button
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 19.0),
                  child: Divider(
                    thickness: 0.25,
                    color: Color(0xFF8D8D8D),
                    height: 2,
                  )),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(15, 15, 30, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomSizedBox(
                          context: context,
                          width: 15,
                        ),
                        Image.asset(
                          "assets/images/sacombank.png",
                          height: 24,
                          width: 24,
                        ),
                        CustomSizedBox(
                          context: context,
                          width: 9,
                        ),
                        CustomText(
                            text: "Sacombank",
                            color: Colors.black38,
                            context: context,
                            fontSize: 15),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "*6694...",
                          color: CustomColor.black,
                          context: context,
                          fontSize: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          // When the child is tapped, show a snackbar.
          onTap: () {
            print("object");
          },
          // The custom button
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 19.0),
                  child: Divider(
                    thickness: 0.25,
                    color: Color(0xFF8D8D8D),
                    height: 2,
                  )),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(0, 15, 30, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSizedBox(
                      context: context,
                      width: 15,
                    ),
                    Image.asset(
                      "assets/images/plus-icon.png",
                      height: 20,
                      width: 20,
                      color: Colors.black38,
                    ),
                    CustomSizedBox(
                      context: context,
                      width: 5,
                    ),
                    Text(
                      "Add New Wallet Linked Bank Account",
                      style: TextStyle(color: Colors.black45, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ListTile(
        //   focusColor: CustomColor.purple,
        //   selectedTileColor: CustomColor.purple,
        //   title: const Text("Elevator"),
        //   leading: Radio(
        //     activeColor: CustomColor.purple,
        //     value: BestTutorSite.GoWithElevator,
        //     groupValue: _site,
        //     onChanged: (BestTutorSite value) {
        //       setState(() {
        //         _site = value;
        //       });
        //     },
        //   ),
        // ),
      ],
    );
  }
}
