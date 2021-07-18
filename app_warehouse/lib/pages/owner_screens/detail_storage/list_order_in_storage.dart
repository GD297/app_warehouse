import 'package:app_warehouse/common/avatar_widget.dart';
import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_app_bar_logo.dart';

import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';

import 'package:flutter/material.dart';

class ListOrderInStorage extends StatelessWidget {
  List<Map<String, dynamic>> mockUpData = [
    {
      'imagePath': 'assets/images/storage1.png',
      'name': 'Lakeview self storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage2.png',
      'name': 'USA self Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage3.png',
      'name': 'Chalmetter super Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage4.png',
      'name': 'Mountain Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomAppBar(
                isHome: false,
                isOwner: true,
              ),
            ),
            Column(
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
                      Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 19, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          child: Image.asset(
                                            'assets/images/4m2.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                          )),
                                      CustomSizedBox(
                                        context: context,
                                        width: 16,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: 'Area 4m2',
                                              color: CustomColor.black,
                                              context: context,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomSizedBox(
                                              context: context,
                                              height: 5,
                                            ),
                                            CustomSizedBox(
                                              context: context,
                                              height: 4,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.6,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomText(
                                                          text: 'Qty: 1',
                                                          color:
                                                              CustomColor.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          context: context,
                                                          fontSize: 13),
                                                      Container(
                                                        child: CustomText(
                                                          text: '1,600,00, VND',
                                                          textAlign:
                                                              TextAlign.right,
                                                          color: CustomColor
                                                              .purple,
                                                          context: context,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      color: CustomColor.white,
                                      child: Divider(
                                        thickness: 0.54,
                                        color: Color(0xFF8D8D8D),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 24, right: 24, bottom: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                  text: 'Total (x' +
                                                      '1'
                                                          '): ',
                                                  color: CustomColor.black,
                                                  context: context,
                                                  fontSize: 16),
                                              CustomText(
                                                text: '1,600,000 VND',
                                                color: CustomColor.purple,
                                                context: context,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Order ID: ",
                                      color: CustomColor.black,
                                      context: context,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: '#2324215223',
                                      color: CustomColor.black,
                                      context: context,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                CustomSizedBox(
                                  context: context,
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Order Date: ",
                                      color: CustomColor.black,
                                      context: context,
                                      fontSize: 15,
                                    ),
                                    CustomText(
                                      text: '15 May 2021 07:14',
                                      color: CustomColor.black,
                                      context: context,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                CustomSizedBox(
                                  context: context,
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Payment Date: ",
                                      color: CustomColor.black,
                                      context: context,
                                      fontSize: 15,
                                    ),
                                    CustomText(
                                      text: '15 May 2021 07:14',
                                      color: CustomColor.black,
                                      context: context,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Delivery Date: ",
                                      color: CustomColor.black,
                                      context: context,
                                      fontSize: 15,
                                    ),
                                    CustomText(
                                      text: '17 May 2021 07:14',
                                      color: CustomColor.black,
                                      context: context,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                Container(
                                  color: CustomColor.white,
                                  child: Divider(
                                    thickness: 0.54,
                                    color: Color(0xFF8D8D8D),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                        text: 'Subtotal: ',
                                        color: CustomColor.black,
                                        context: context,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                    CustomText(
                                      text: "1,600,000 VND",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                        text: 'Discount Subtotal (10%): ',
                                        color: CustomColor.black,
                                        context: context,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                    CustomText(
                                      text: '- 160,000 VND',
                                      color: Colors.red,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                        text: 'Total Payment: ',
                                        color: CustomColor.black,
                                        context: context,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    CustomText(
                                      text: '1,600,000 VND',
                                      color: CustomColor.purple,
                                      context: context,
                                      fontSize: 17,
                                      maxLines: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      color: CustomColor.white,
                                      child: Divider(
                                        thickness: 0.54,
                                        color: Color(0xFF8D8D8D),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: CustomText(
                                          text: "Screenshot",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          context: context,
                                          fontSize: 17),
                                    ),
                                    CustomSizedBox(
                                      context: context,
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: Image.asset(
                                            'assets/images/luukho1.png',
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          onTap: () async {
                                            await showDialog(
                                                context: context,
                                                builder: (_) => Dialog(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                          image: ExactAssetImage(
                                                              'assets/images/luukho1.png'),
                                                        )),
                                                      ),
                                                    ));
                                          },
                                        ),
                                        CustomSizedBox(
                                          context: context,
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          child: Image.asset(
                                            'assets/images/luukho2.png',
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          onTap: () async {
                                            await showDialog(
                                                context: context,
                                                builder: (_) => Dialog(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                          image: ExactAssetImage(
                                                              'assets/images/luukho2.png'),
                                                        )),
                                                      ),
                                                    ));
                                          },
                                        ),
                                        CustomSizedBox(
                                          context: context,
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          child: Image.asset(
                                            'assets/images/luukho3.png',
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          onTap: () async {
                                            await showDialog(
                                                context: context,
                                                builder: (_) => Dialog(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                          image: ExactAssetImage(
                                                              'assets/images/luukho3.png'),
                                                        )),
                                                      ),
                                                    ));
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                CustomSizedBox(
                                  context: context,
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
              child: Column(children: [
                CustomSizedBox(
                  context: context,
                  height: 25,
                ),
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
                          role: 'Customer'),
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
                CustomSizedBox(
                  context: context,
                  height: 25,
                ),
              ]),
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
