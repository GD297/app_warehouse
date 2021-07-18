import 'dart:ui';

import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_radio_button.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_time_tag.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/common/info_address.dart';
import 'package:app_warehouse/common/item_cart.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/self_storage_bill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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

  _selectDate(
      {@required BuildContext context,
      @required DateTime initialDate,
      @required DateTime startDate}) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: startDate,
        lastDate: DateTime(2022));
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
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
              padding: EdgeInsets.symmetric(vertical: 10),
              width: deviceSize.width * 0.57,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'Total Price: ',
                            color: CustomColor.black,
                            context: context,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        CustomText(
                          text: '3.641.000 VND',
                          color: CustomColor.purple,
                          context: context,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'Discount (10%): ',
                            color: CustomColor.black,
                            context: context,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        CustomText(
                          text: '- 450.500 VND',
                          color: CustomColor.red,
                          context: context,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ],
                ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => SelfStorageBill()));
                  },
                  buttonColor: CustomColor.purple,
                  borderRadius: 4),
            ),
          ],
        ),
      ),
      backgroundColor: CustomColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                isHome: false,
                isOwner: false,
              ),
              InfoAddress(),
              CustomText(
                  text: 'Your cart',
                  color: CustomColor.black,
                  context: context,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              CustomSizedBox(
                context: context,
                height: 8,
              ),
              Container(
                height: deviceSize.height / 1.45,
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 2,
                  color: CustomColor.purple,
                )),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: datas.length,
                    itemBuilder: (ctx, index) => Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: ItemCart(
                        data: datas[index],
                        isModify: true,
                      ),
                    ),
                  ),
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Months: ',
                    color: CustomColor.black,
                    context: context,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: TextButton(
                          onPressed: () {},
                          child: Image.asset('assets/images/sub.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      CustomText(
                        text: 3.toString(),
                        color: CustomColor.purple,
                        context: context,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        child: TextButton(
                            onPressed: () {},
                            child: Image.asset('assets/images/plus.png',
                                fit: BoxFit.cover)),
                      ),
                    ],
                  )
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
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
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => {
                            _selectDate(
                                context: context,
                                initialDate: DateTime.now(),
                                startDate: DateTime.now()),
                          },
                          icon: ImageIcon(
                            AssetImage('assets/images/calendar.png'),
                          ),
                        ),
                        CustomText(
                            text: DateFormat()
                                .addPattern("dd-MM-yyyy")
                                .format(DateTime.now()),
                            color: CustomColor.purple,
                            context: context,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ],
                    ),
                  ],
                ),
              ),
              CustomTimeTag(),
              CustomSizedBox(
                context: context,
                height: 8,
              ),
              CustomText(
                text: 'Which type of stair?',
                color: CustomColor.black,
                context: context,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              CustomRadioButton(),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    // Container(
                    //     child: Image.asset(
                    //   'assets/images/shippingtruck.png',
                    //   width: 20,
                    //   height: 20,
                    // )),
                    CustomText(
                      text: 'Shipping fee: ',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ]),
                  CustomText(
                      text: '30.000 VND',
                      color: CustomColor.purple,
                      context: context,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
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
                      text: 'Sub price: ',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  CustomText(
                    text: '3.915.000 VND',
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
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
                      text: 'Discount: ',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  CustomText(
                    text: '- 274.050VND',
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
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
                      text: 'Total Price: ',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  CustomText(
                    text: '3.641.000 VND',
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
