import 'package:app_warehouse/common/box_input_price.dart';
import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/bill/order_customer_screen.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/status_shelf.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnerDetailStorageNew extends StatefulWidget {
  @override
  _OwnerDetailStorageState createState() => _OwnerDetailStorageState();
}

class _OwnerDetailStorageState extends State<OwnerDetailStorageNew> {
  TextEditingController _priceSmallBoxController;
  TextEditingController _priceLargeBoxController;
  double get _priceSmallBox => double.parse(_priceSmallBoxController.text);
  double get _priceLargeBox => double.parse(_priceLargeBoxController.text);
  FocusNode _priceSmallBoxFocusNode;
  FocusNode _priceLargeBoxFocusNode;
  List<Map<String, dynamic>> dataShelves;
  @override
  void initState() {
    super.initState();
    _priceSmallBoxController = TextEditingController();
    _priceLargeBoxController = TextEditingController();
    _priceSmallBoxFocusNode = FocusNode();
    _priceLargeBoxFocusNode = FocusNode();
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
    _priceLargeBoxController.dispose();
    _priceSmallBoxFocusNode.dispose();
    _priceLargeBoxFocusNode.dispose();
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
                text: 'Storage A-01',
                color: CustomColor.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 24),
            CustomSizedBox(
              context: context,
              height: 24,
            ),
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/4m2.png',
                height: 100,
                width: 100,
              ),
            ),
            CustomText(
                text: "Size: 2m x 2m x 2m",
                color: Colors.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomText(
                text: "Price: 1,600,000",
                color: Colors.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomText(
                text: "Rent By: Clarren Jessica",
                color: Colors.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomText(
                text: "Start Date: 20/04/2021",
                color: Colors.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomText(
                text: "End Date: 20/07/2021",
                color: Colors.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomSizedBox(
              context: context,
              height: 24,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomText(
                color: CustomColor.black,
                context: context,
                fontSize: 24,
                text: 'Order',
                fontWeight: FontWeight.bold,
              ),
            ]),
            CustomSizedBox(
              context: context,
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => OrderCustomerScreen(
                          isStorage: true,
                              inRoom: false,
                              listOrder: [listOrder[0]],
                            )));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 14,
                          offset: Offset(0, 6),
                          color: Colors.black.withOpacity(0.06))
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: deviceSize.width / 1.7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(24),
                          //   child: Container(
                          //       width: 48,
                          //       height: 48,
                          //       child: Image.asset(
                          //         data['avatarPath'],
                          //         fit: BoxFit.cover,
                          //       )),
                          // ),
                          CustomSizedBox(
                            context: context,
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // CustomText(
                              //   text: data['customerName'],
                              //   color: CustomColor.black,
                              //   context: context,
                              //   fontSize: 16,
                              //   fontWeight: FontWeight.bold,
                              // ),
                              // CustomSizedBox(
                              //   context: context,
                              //   height: 8,
                              // ),
                              CustomText(
                                text: '#2307202111',
                                color: CustomColor.black,
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomSizedBox(
                                context: context,
                                height: 8,
                              ),

                              CustomSizedBox(
                                context: context,
                                height: 8,
                              ),
                              CustomText(
                                  text: 'Expired Date: 20/07/2021',
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 14),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
