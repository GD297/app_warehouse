import 'package:app_warehouse/common/bill_info_few_widget.dart';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/history_booking/request_refund_.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:app_warehouse/pages/customer_screens/payment_options_screen/payment_option_widget.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class BillFewWidget extends StatelessWidget {
  final Order data;
  bool isHistory;
  bool isCheckout;
  BillFewWidget(
      {@required this.data, @required this.isCheckout, this.isHistory});

  Widget _statusWidget({@required BuildContext context}) {
    if (data.status != null) {
      Color colorTitle;
      String status;
      switch (data.status) {
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
        padding: EdgeInsets.symmetric(horizontal: 23),
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
      return CustomSizedBox(context: context);
    }
  }

  Widget _qrCodeWidget(
      {@required BuildContext context, @required final order}) {
    if (!isCheckout) {
      return Column(children: [
        // Container(
        //   height: MediaQuery.of(context).size.height / 8,
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       border: Border.all(color: CustomColor.purple)),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       AvatarWidget(
        //           deviceSize: MediaQuery.of(context).size,
        //           isHome: false,
        //           name: 'Clarren Jessica',
        //           imageUrl: 'assets/images/avatar.png',
        //           role: 'Owner'),
        //       ClipRRect(
        //         borderRadius: BorderRadius.circular(8),
        //         child: Container(
        //           height: MediaQuery.of(context).size.height / 16,
        //           width: MediaQuery.of(context).size.height / 16,
        //           color: CustomColor.green,
        //           child: TextButton(
        //               onPressed: () {},
        //               child: Image.asset('assets/images/call.png')),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        Column(children: [
          if (order.status == 'Delivered')
            Column(
              children: [
                Container(
                  color: CustomColor.white,
                  child: Divider(
                    thickness: 0.54,
                    color: Color(0xFF8D8D8D),
                  ),
                ),
              ],
            ),
          CustomText(
              text: "Scan QR Code to confirm item have been sent or received",
              color: CustomColor.black,
              context: context,
              fontWeight: FontWeight.w600,
              fontSize: 15),
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
          CustomSizedBox(
            context: context,
            height: 20,
          ),
        ]),
      ]);
    } else {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: CustomPaymentWidget());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            color: Colors.white,
            child: _qrCodeWidget(context: context, order: data)),
        CustomSizedBox(
          context: context,
          height: 16,
        ),
        BillInfoFewWidget(
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
        // ),
        Container(
          color: Colors.white,
          child: CustomSizedBox(
            context: context,
            height: 30,
            width: double.infinity,
          ),
        ),

        if (data.status == 'Delivered')
          Column(
            children: [
              Container(
                color: CustomColor.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: CustomColor.purple, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                text: 'Your rating',
                                color: CustomColor.black,
                                context: context,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            CustomSizedBox(
                              context: context,
                              height: 8,
                            ),
                            RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.only(right: 4),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            CustomSizedBox(
                              context: context,
                              height: 8,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText: 'Your comment...',
                                  fillColor: Colors.white,
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none),
                            ),
                            CustomSizedBox(
                              context: context,
                              height: 4,
                            ),
                            CustomButton(
                                height: 32,
                                text: 'Comment',
                                width: double.infinity,
                                textColor: CustomColor.green,
                                onPressFunction: () {},
                                buttonColor: CustomColor.lightBlue,
                                borderRadius: 4),
                            CustomSizedBox(
                              context: context,
                              height: 16,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: CustomSizedBox(
                  context: context,
                  height: 30,
                  width: double.infinity,
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: CustomButton(
                          height: 40,
                          text: 'Add More Item',
                          width: double.infinity,
                          textColor: CustomColor.white,
                          onPressFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ChangeRequestDelivery(
                                          title: 'Add More Item',
                                          order: data,
                                        )));
                          },
                          buttonColor: CustomColor.purple,
                          borderRadius: 4),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: CustomButton(
                          height: 40,
                          text: 'Get Back Item',
                          width: double.infinity,
                          textColor: CustomColor.white,
                          onPressFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ChangeRequestDelivery(
                                          title: 'Get Item Back',
                                          order: data,
                                        )));
                          },
                          buttonColor: CustomColor.purple,
                          borderRadius: 4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        Container(
          color: Colors.white,
          child: CustomSizedBox(
            context: context,
            height: 30,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
