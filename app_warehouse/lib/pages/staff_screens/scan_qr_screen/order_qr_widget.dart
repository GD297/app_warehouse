import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/bill_info_few_widget.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/order_customer_qr.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/screen_qr_screen.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/material.dart';

class OrderQRWidget extends StatelessWidget {
  final Order data;
  bool isHistory;
  bool isCheckout;
  bool isDelivery;
  bool isStored;
  OrderQRWidget(
      {@required this.data,
      @required this.isCheckout,
      this.isHistory,
      @required this.isStored,
      this.isDelivery});

  Widget _statusWidget({@required BuildContext context}) {
    if (isDelivery && !isStored) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 24),
        child: Column(
          children: [
            Row(
              children: [
                CustomSizedBox(
                  context: context,
                  width: 50,
                ),
                Image.asset(
                  'assets/images/check.png',
                  height: 30,
                  width: 30,
                ),
                CustomSizedBox(
                  context: context,
                  width: 10,
                ),
                CustomText(
                    text: 'Order has been confirmed',
                    color: Colors.green,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ],
            ),
          ],
        ),
      );
    } else if (isDelivery && isStored) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 24),
        child: Column(
          children: [
            Row(
              children: [
                CustomSizedBox(
                  context: context,
                  width: 25,
                ),
                Image.asset(
                  'assets/images/check.png',
                  height: 30,
                  width: 30,
                ),
                CustomSizedBox(
                  context: context,
                  width: 10,
                ),
                CustomText(
                    text: 'Order has been Stored',
                    color: Colors.green,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ],
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: CustomSizedBox(
          context: context,
          height: 15,
        ),
      );
    }
  }

  Widget _qrCodeWidget(
      {@required BuildContext context, @required final order}) {
    if (!isDelivery && !isStored) {
      return Column(children: [
        Column(children: [
          CustomSizedBox(
            context: context,
            height: 25,
          ),
          CustomSizedBox(
            context: context,
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomButton(
                height: 40,
                text: 'Confirm',
                width: double.infinity,
                textColor: CustomColor.white,
                onPressFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => OrderCustomerQR(
                                isDelivery: true,
                                isStored: false,
                                listOrder: [order],
                              )));
                },
                buttonColor: CustomColor.purple,
                borderRadius: 4),
          ),
        ]),
      ]);
    } else if (!isStored) {
      return Column(children: [
        Column(children: [
          CustomSizedBox(
            context: context,
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomButton(
                height: 40,
                text: 'Store Orders',
                width: double.infinity,
                textColor: CustomColor.white,
                onPressFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ScanQRScreen(
                            
                                isStored: true,
                              )));
                },
                buttonColor: CustomColor.purple,
                borderRadius: 4),
          ),
          CustomSizedBox(
            context: context,
            height: 25,
          ),
        ]),
      ]);
    } else if (isStored) {
      return Column(children: [
        Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                    text: "Stored at:",
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                CustomText(
                    text: " Room A-01",
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ],
            ),
          ),
          CustomSizedBox(
            context: context,
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomButton(
                height: 40,
                text: 'Change Room',
                width: double.infinity,
                textColor: CustomColor.white,
                onPressFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ScanQRScreen(
                                isStored: true,
                              )));
                },
                buttonColor: CustomColor.purple,
                borderRadius: 4),
          ),
          CustomSizedBox(
            context: context,
            height: 25,
          ),
        ]),
      ]);
    } else {
      Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _statusWidget(context: context),
        BillQRFewWidget(
          order: data,
          isHistory: isHistory,
        ),

        // BoxInfoBillWidget(
        //     deviceSize: deviceSize,
        //     price: '400,000 VND',
        //     imagePath: 'assets/images/smallBox.png',
        //     size: '0.5m x 1m x 2m'),
        // CustomSizedBox(
        //   context: context,
        //   height: 32,
        // ),
        // BoxInfoBillWidget(
        //     deviceSize: deviceSize,
        //     price: '750,000 VND',
        //     imagePath: 'assets/images/largeBox.png',
        //     size: '1m x 1m x 2m'),
        // CustomSizedBox(
        //   context: context,
        //   height: 24,
        // ),\

        Container(
            width: double.infinity,
            color: Colors.white,
            child: _qrCodeWidget(context: context, order: data)),
        CustomSizedBox(
          context: context,
          height: 16,
        ),
      ],
    );
  }
}
