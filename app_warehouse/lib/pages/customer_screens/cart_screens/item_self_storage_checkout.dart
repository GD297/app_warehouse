import 'dart:ui';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/common/info_address_new.dart';
import 'package:app_warehouse/pages/customer_screens/bottom_navigation/customer_bottom_navigation.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/item_self_storage_widget.dart';
import 'package:app_warehouse/pages/customer_screens/payment_options_screen/payment_option_widget.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemSelfStorageCheckout extends StatefulWidget {
  @override
  State<ItemSelfStorageCheckout> createState() => _ItemFewCheckoutState();
}

class _ItemFewCheckoutState extends State<ItemSelfStorageCheckout> {
  DateTime picked;
  @override
  void initState() {
    picked = DateTime.now();
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: picked,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != pickedDate)
      setState(() {
        picked = pickedDate;
      });
    print(pickedDate);
  }

  static List<Map<String, dynamic>> mockUpSelfStorateData = [
    {
      'imagePath': 'assets/images/2m2final2.png',
      'name': 'Storage 2m' + String.fromCharCode(0x00B2),
      'decription': 'Used to store small furniture,\nsmall quantity:',
      'price': "600,000",
      'newPrice': "600.000 VND/ month",
      'size': '2m x 4m x 2,5m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '6 boxes of 86m3',
        '1 student desk',
        '1 student seat',
        '1 mini bike'
      ],
    },
    {
      'imagePath': 'assets/images/4m2.png',
      'name': 'Storage 4m' + String.fromCharCode(0x00B2),
      'decription': 'Tương đương kho lưu trữ nhỏ:',
      'price': "1,000,000",
      'newPrice': "1.000.000 VND / month",
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '9 bins of 86m3',
        '1 dining table',
        '4 dining chairs',
        '1 bike',
        '1 single mattress',
        '1 sofa'
      ],
    },
    {
      'imagePath': 'assets/images/8m2.png',
      'name': 'Storage 8m' + String.fromCharCode(0x00B2),
      'decription':
          'Suitcase size M < 70L/ Microwave/ Clothes box < 25kg/ Standing fan/ Baby stroller..',
      'price': "1,600,000",
      'newPrice': '1,600.000 VND / month',
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '12 bins 86m' + String.fromCharCode(0x00B3),
        '1 dining table',
        '4 dining chairs',
        '2 bicycles',
        '1 queen/king mattress',
        '1 set of sofa table',
        '1 coffee table',
        '1 refrigerator 1 door',
        '1 TV',
        '1 small bookshelf',
        '1 small wardrobe ',
      ],
    },
    {
      'imagePath': 'assets/images/16m2.png',
      'name': 'Storage 16m' + String.fromCharCode(0x00B2),
      'decription':
          'Suitcase size L/ Air conditioner/ Bicycle/ Refrigerator 90L/ Folding mattress 1.6/ Single sofa...',
      'price': "2,800,000",
      'newPrice': "2,800,000 VND / month",
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '18 bins 86m' + String.fromCharCode(0x00B3),
        '1 dining table',
        '1 set of large tables and chairs',
        '4 dining chairs',
        '4 bicycles',
        '2 queen/king mattress',
        '1 set of sofa table',
        '1 set coffee tables and chairs',
        '1 2-door refrigerator',
        '1 large TV',
        '1 large bookshelf',
        '1 large wardrobe',
        '1 dressing table '
      ]
    },
  ];

  List<dynamic> datas = [
    {
      'image': 'assets/images/4m2.png',
      'name': '2m x 2m x 2.5m',
      'price': '1.000.000 VND / month',
      'amount': '2',
      'type': 'storage'
    },
    {
      'image': 'assets/images/8m2.png',
      'name': '2m x 4m x 2.5m',
      'price': '1.600.000 VND / month',
      'amount': '1',
      'type': 'storage'
    },
    {
      'image': 'assets/images/thungcarton.png',
      'name': 'Carton Box',
      'price': '25.000 VND / box',
      'amount': '5',
      'type': 'accessory'
    },
    {
      'image': 'assets/images/icon_okhoa.png',
      'name': 'Lock',
      'price': '50.000 VND / lock',
      'amount': '3',
      'type': 'accessory'
    }
  ];
  final oCcy = new NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final orders = Provider.of<Orders>(context);
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: CustomColor.purple,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 5,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
          border: Border.all(
            width: 1,
            color: Color(0xfff0f0f0),
          ),
        ),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              width: deviceSize.width * 0.57,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                      text: 'Total Price: ',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  CustomText(
                    text: '1,630,000 VND',
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
            CustomSizedBox(
              context: context,
              width: 10,
            ),
            Container(
              width: deviceSize.width * 0.4,
              child: CustomButton(
                  height: 55,
                  text: 'Booking now',
                  width: double.infinity,
                  textColor: CustomColor.white,
                  onPressFunction: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CustomerBottomNavigation()),
                        ModalRoute.withName('/'));
                  },
                  buttonColor: CustomColor.purple,
                  borderRadius: 4),
            ),
          ],
        ),
      ),
      backgroundColor: CustomColor.white,
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xfff0f0f0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: InfoAddressNew(),
              ),
              CustomSizedBox(
                context: context,
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mockUpSelfStorateData.length - 2,
                    itemBuilder: (ctx, index) => Container(
                      margin: const EdgeInsets.only(bottom: 1),
                      child: Container(
                        child:
                            ItemSelfStorageWidget(mockUpSelfStorateData[index]),
                      ),
                    ),
                  ),
                  Container(
                    color: CustomColor.white,
                    child: Divider(
                      thickness: 0.54,
                      color: Color(0xFF8D8D8D),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                                text: "2 Items, Subtotal:",
                                color: CustomColor.black,
                                context: context,
                                fontSize: 13),
                            CustomSizedBox(
                              context: context,
                              width: 10,
                            ),
                            CustomText(
                              text: '1,600,000 VND',
                              color: CustomColor.black,
                              context: context,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 5,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    CustomPaymentWidget(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 13, 0, 5),
                        child: CustomText(
                          text: "Order Information",
                          color: CustomColor.black,
                          context: context,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: CustomColor.white,
                child: Divider(
                  thickness: 0.54,
                  color: Color(0xFF8D8D8D),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Rent Time: ',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      text: '3 (months)',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: 'Delivery Date: ',
                              color: CustomColor.black,
                              context: context,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                          CustomText(
                              text: DateFormat()
                                  .addPattern("dd-MM-yyyy")
                                  .format(DateTime.now()),
                              color: CustomColor.black,
                              context: context,
                              fontSize: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'End Date: ',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      text: DateFormat()
                          .addPattern("dd-MM-yyyy")
                          .format(DateTime.now().add(Duration(days: 3 * 30))),
                      color: CustomColor.black,
                      context: context,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              Container(
                color: CustomColor.white,
                child: Divider(
                  thickness: 0.54,
                  color: Color(0xFF8D8D8D),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'Mechandise ',
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 16,
                            ),
                            CustomText(
                              text: "(2 Items)",
                              color: Colors.black45,
                              context: context,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        CustomText(
                          text: '1,600,000 VND',
                          color: CustomColor.black,
                          context: context,
                          fontSize: 16,
                        )
                      ],
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Stair Fee:',
                      color: CustomColor.black,
                      context: context,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    CustomText(
                      text: '15,000 VND',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                color: Colors.white,
                child: Column(
                  children: [
                    CustomSizedBox(
                      context: context,
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: 'Total: ',
                            color: CustomColor.black,
                            context: context,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        CustomText(
                          text: '1,630,000 VND',
                          color: CustomColor.black,
                          context: context,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 9,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: CustomSizedBox(
                  context: context,
                  height: 20,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
