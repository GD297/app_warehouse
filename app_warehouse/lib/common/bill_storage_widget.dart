import 'package:app_warehouse/common/avatar_widget.dart';
import 'package:app_warehouse/common/bill_info_storage_widget.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/payment_options_screen/payment_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class BillStorageWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  bool isCheckout;
  BillStorageWidget({@required this.data, @required this.isCheckout});

  Widget _statusWidget({@required BuildContext context}) {
    if (data['status'] != null) {
      Color colorTitle;
      String status;
      switch (data['title']) {
        case 'Paid':
          {
            colorTitle = CustomColor.green;
            status = "Paid";
            break;
          }
        case 'Warning!':
          {
            colorTitle = Colors.yellow[800];
            status = "Warning";

            break;
          }
        case 'Expired!':
          {
            colorTitle = Colors.red[900];
            status = "Expired";
            break;
          }
        case 'Delivered':
          {
            colorTitle = CustomColor.purple;
            status = "Delivered";
            break;
          }
        case 'Checkout':
          {
            colorTitle = CustomColor.purple;
            status = "Checkout";
            break;
          }
      }
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Status: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: status,
                  color: colorTitle,
                  context: context,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
          ],
        ),
      );
    } else {
      return Column();
    }
  }

  Widget _qrCodeWidget({@required BuildContext context}) {
    if (!isCheckout) {
      return Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 8,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: CustomColor.purple)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvatarWidget(
                  deviceSize: MediaQuery.of(context).size,
                  isHome: false,
                  name: 'Clarren Jessica',
                  imageUrl: 'assets/images/avatar.png',
                  role: 'Owner'),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.height / 16,
                  color: CustomColor.green,
                  child: TextButton(
                      onPressed: () {},
                      child: Image.asset('assets/images/call.png')),
                ),
              ),
            ],
          ),
        ),
        Column(children: [
          CustomSizedBox(
            context: context,
            height: 24,
          ),
          QrImage(
            data: 'test',
            size: 88.0,
            version: 2,
          ),
          CustomSizedBox(
            context: context,
            height: 8,
          ),
          CustomText(
            text: 'Expired date: ' +
                DateFormat()
                    .addPattern("dd/MM/yyyy")
                    .format(DateTime.now().add(Duration(days: 30))),
            color: CustomColor.black[1],
            context: context,
            fontSize: 16,
          ),
        ])
      ]);
    } else {
      return CustomPaymentWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      color: CustomColor.white,
      child: Column(
        children: [
          _statusWidget(context: context),
          CustomSizedBox(
            context: context,
            height: 16,
          ),
          BillInfoStorageWidget(
            data: data,
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

          _qrCodeWidget(context: context),
          CustomSizedBox(
            context: context,
            height: 16,
          ),
        ],
      ),
    );
  }
}
