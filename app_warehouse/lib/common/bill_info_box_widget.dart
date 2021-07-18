import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/common/item_cart.dart';
import 'package:app_warehouse/pages/customer_screens/payment_options_screen/payment_option_widget.dart';
import 'package:flutter/material.dart';

class BillInfoBoxWidget extends StatelessWidget {
  bool isHistory = false;

  BillInfoBoxWidget({this.isHistory});
  List<dynamic> datas = [
    {
      'image': 'assets/images/4m2.png',
      'name': '2m x 2m x 2.5m',
      'price': '1.000.000 VND / month',
      'amount': '2'
    },
    {
      'image': 'assets/images/8m2.png',
      'name': '2m x 4m x 2.5m',
      'price': '1.600.000 VND / month',
      'amount': '1'
    },
    {
      'image': 'assets/images/thungcarton.png',
      'name': 'Carton Box',
      'price': '25.000 VND / box',
      'amount': '5'
    },
    {
      'image': 'assets/images/icon_okhoa.png',
      'name': 'Lock',
      'price': '50.000 VND / lock',
      'amount': '3'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: deviceSize.width,
            color: CustomColor.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.location_on,
                        color: CustomColor.purple,
                        size: 25.0,
                      ),
                    ),
                    CustomSizedBox(
                      context: context,
                      width: 10,
                    ),
                    CustomText(
                      text: 'Address pick up your items',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 15,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                    ),
                  ],
                ),
                CustomSizedBox(context: context, height: 10),
                Container(
                  padding: EdgeInsets.only(left: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Jessica Clarent',
                        color: CustomColor.black,
                        context: context,
                        fontSize: 13,
                      ),
                      CustomText(
                        text: '0777547456',
                        color: CustomColor.black,
                        context: context,
                        fontSize: 13,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CustomSizedBox(
                      context: context,
                      width: 34,
                    ),
                    Container(
                      width: deviceSize.width / 1.5,
                      child: CustomText(
                          text:
                              'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City',
                          color: CustomColor.black,
                          context: context,
                          maxLines: 2,
                          fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        CustomSizedBox(
          context: context,
          height: 10,
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.purple),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: deviceSize.height / 1.45,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: datas.length,
                          itemBuilder: (ctx, index) => Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: ItemCart(
                              data: datas[index],
                              isModify: false,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: 'Subtotal: ',
                              color: CustomColor.black,
                              context: context,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                          CustomText(
                            text: '3.915.000 VND',
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
                              text: 'Shipping Fee: ',
                              color: CustomColor.black,
                              context: context,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                          CustomText(
                            text: '30,000 VND (~3km)',
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
                              text: 'Stair Fee: ',
                              color: CustomColor.black,
                              context: context,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                          CustomText(
                            text: '30,000 VND (2 stairs)',
                            color: CustomColor.purple,
                            context: context,
                            fontSize: 16,
                            maxLines: 2,
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
                              text: 'Discount Subtotal (7%): ',
                              color: CustomColor.black,
                              context: context,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                          CustomText(
                            text: '- 274.050 VND',
                            color: CustomColor.purple,
                            context: context,
                            fontSize: 16,
                            maxLines: 2,
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
                              text: 'Total Payment: ',
                              color: CustomColor.black,
                              context: context,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          CustomText(
                            text: '3.641.000 VND',
                            color: CustomColor.purple,
                            context: context,
                            fontSize: 16,
                            maxLines: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (!isHistory)
                Column(
                  children: [
                    CustomSizedBox(
                      context: context,
                      height: 10,
                    ),
                    CustomPaymentWidget(),
                    CustomSizedBox(
                      context: context,
                      height: 10,
                    ),
                    CustomButton(
                        height: 32,
                        text: 'Confirm',
                        width: double.infinity,
                        textColor: CustomColor.green,
                        onPressFunction: () {},
                        buttonColor: CustomColor.lightBlue,
                        borderRadius: 4),
                    CustomSizedBox(
                      context: context,
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
