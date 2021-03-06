import 'package:app_warehouse/common/avatar_widget.dart';
import 'package:app_warehouse/common/box_info_bill_widget.dart';
import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailBillScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  DetailBillScreen({this.data});

  final positionSmallBox = {'Shelf - 1': 'A1, B2', 'Shelf - 2': 'A2, C1'};
  final positionLargeBox = {
    'Shelf - 1': 'C1',
  };

  Widget _buildPosition(
      {@required Map<String, String> position,
      @required Size deviceSize,
      @required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: deviceSize.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSizedBox(
            context: context,
            width: 40,
          ),
          CustomText(
            text: 'Positions: ',
            color: CustomColor.black,
            context: context,
            fontSize: 16,
            textAlign: TextAlign.end,
            fontWeight: FontWeight.bold,
          ),
          CustomSizedBox(
            context: context,
            width: 8,
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_, index) {
              String shelf = positionSmallBox.keys.toList()[index];

              return CustomText(
                  text: '$shelf - ${positionSmallBox[shelf]}',
                  color: CustomColor.black,
                  context: context,
                  fontSize: 16);
            },
            itemCount: positionSmallBox.keys.length,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            CustomAppBar(
              isHome: false,
              isOwner: true,
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Storage name: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: data['storageName'],
                  color: CustomColor.black,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'ID Order: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: data['orderId'],
                  color: CustomColor.black,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Expired Date: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: data['expiredDate'],
                  color: CustomColor.black,
                  context: context,
                  fontSize: 16,
                ),
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Price: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: data['price'],
                  color: CustomColor.purple,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Months: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: data['months'].toString(),
                  color: CustomColor.purple,
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
            BoxInfoBillWidget(
              deviceSize: deviceSize,
              imagePath: 'assets/images/smallBox.png',
              price: '200,000VND',
              size: '0.5m x 1m x 1m',
              amount: 4,
            ),
            if (data['status'] != StatusBill.PAID)
              _buildPosition(
                  position: positionSmallBox,
                  deviceSize: deviceSize,
                  context: context),
            CustomSizedBox(
              context: context,
              height: 40,
            ),
            BoxInfoBillWidget(
              deviceSize: deviceSize,
              imagePath: 'assets/images/largeBox.png',
              price: '200,000VND',
              size: '1m x 1m x 1m',
              amount: 1,
            ),
            if (data['status'] != StatusBill.PAID)
              _buildPosition(
                  position: positionLargeBox,
                  deviceSize: deviceSize,
                  context: context),
            CustomSizedBox(
              context: context,
              height: 24,
            ),
            Container(
              height: deviceSize.height / 8,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: CustomColor.purple)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AvatarWidget(
                      deviceSize: deviceSize,
                      isHome: false,
                      name: 'Clarren Jessica',
                      imageUrl: 'assets/images/avatar.png',
                      role: 'Customer'),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: deviceSize.height / 16,
                      width: deviceSize.height / 16,
                      color: CustomColor.green,
                      child: TextButton(
                          onPressed: () {},
                          child: Image.asset('assets/images/call.png')),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
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
                  text: 'Expired date: ${data['expiredDate']}',
                  color: CustomColor.black[1],
                  context: context,
                  fontSize: 16,
                ),
                CustomSizedBox(
                  context: context,
                  height: 24,
                ),
                CustomSizedBox(
                  context: context,
                  height: 24,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
