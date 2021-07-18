import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_input.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/bill/order_customer_screen.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/order_customer_qr.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailRoomScreen extends StatefulWidget {
  @override
  _DetailRoomScreenState createState() => _DetailRoomScreenState();
}

class _DetailRoomScreenState extends State<DetailRoomScreen> {
  TextEditingController _priceSmallBoxController;

  String get _time => _priceSmallBoxController.text;
  FocusNode _timeFocusNode;
  FocusNode _priceLargeBoxFocusNode;
  List<Map<String, dynamic>> dataShelves;
  @override
  void initState() {
    super.initState();

    _timeFocusNode = FocusNode();

    dataShelves = [
      {
        'name': 'Shelf - 1',
        'percent': 80,
        'listBox': [
          {
            'orderId': 'R001',
            'type': 'large',
            'position': 'B1',
            'timeRemain': '1 Month - 1 Week - 4 Days'
          },
          {
            'orderId': 'R001',
            'type': 'small',
            'position': 'A4',
            'timeRemain': '1 Month - 1 Week - 4 Days'
          },
          {
            'orderId': 'R002',
            'type': 'large',
            'position': 'A1',
            'timeRemain': '1 Week - 4 Days'
          },
          {
            'orderId': 'R002',
            'type': 'small',
            'position': 'A3',
            'timeRemain': '1 Week - 4 Days'
          }
        ]
      },
      {
        'name': 'Shelf - 2',
        'percent': 40,
      },
      {
        'name': 'Shelf - 3',
        'percent': 100,
      },
      {
        'name': 'Shelf - 4',
        'percent': 0,
      },
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _priceSmallBoxController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context);
    List<Order> listOrder = order.orders;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.purple,
      ),
      backgroundColor: CustomColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            CustomSizedBox(
              context: context,
              height: 24,
            ),
            CustomText(
                text: 'Room A-01',
                color: CustomColor.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 24),
            CustomSizedBox(
              context: context,
              height: 24,
            ),
            CustomText(
                text: "Total Orders: 5",
                color: Colors.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Row(
              children: [
                CustomText(
                    text: "Usage: ",
                    color: Colors.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                CustomText(
                    text: "70%",
                    color: Colors.red,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomText(
                text: "Last Check: 13/07/2021",
                color: Colors.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomText(
                text: "Estimate the remaining space. (percent)",
                color: Colors.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            CustomSizedBox(
              context: context,
              height: 24,
            ),
            CustomOutLineInput(
              deviceSize: deviceSize,
              labelText: 'Space',
              isDisable: false,
              focusNode: _timeFocusNode,
              nextNode: _timeFocusNode,
              controller: _priceSmallBoxController,
            ),
            CustomSizedBox(
              context: context,
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: CustomButton(
                  height: 40,
                  text: 'Scan',
                  width: double.infinity,
                  textColor: CustomColor.white,
                  onPressFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => OrderCustomerQR(
                          isDelivery: true,
                          isStored: true,
                          listOrder: [listOrder[0]],
                        ),
                      ),
                    );
                  },
                  buttonColor: CustomColor.purple,
                  borderRadius: 4),
            ),
            CustomSizedBox(
              context: context,
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
