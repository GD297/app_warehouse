import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/history_booking/item_few_widget.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillQRFewWidget extends StatelessWidget {
  bool isHistory = false;
  Order order;
  BillQRFewWidget({this.isHistory, @required this.order});
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
  final oCcy = new NumberFormat("#,##0", "en_US");

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
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: order.listitem.length,
                      itemBuilder: (ctx, index) => Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: ItemFewWidget(
                          isTotal: false,
                          data: order.listitem.values.toList()[index],
                        ),
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
                              text: order.id,
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
                              text: DateFormat()
                                  .addPattern("dd MMM yyyy HH:mm:ss")
                                  .format(order.date),
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
                              text: DateFormat()
                                  .addPattern("dd MMM yyyy HH:mm:ss")
                                  .format(order.date),
                              color: CustomColor.black,
                              context: context,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        if (order.status == 'Deliveried')
                          Row(
                            children: [
                              CustomText(
                                text: "Delivery Date: ",
                                color: CustomColor.black,
                                context: context,
                                fontSize: 15,
                              ),
                              CustomText(
                                text: DateFormat()
                                    .addPattern("dd MMM yyyy HH:mm:ss")
                                    .format(order.date.add(Duration(days: 2))),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: 'Subtotal: ',
                                color: CustomColor.black,
                                context: context,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                            CustomText(
                              text: oCcy.format(order.amount) + " VND",
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
                              text: oCcy.format(order.shippingFee) + " VND",
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
                              text: oCcy.format(order.stairFee) + " VND",
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
                                text: 'Discount Subtotal (10%): ',
                                color: CustomColor.black,
                                context: context,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                            CustomText(
                              text: '-' +
                                  oCcy.format(order.amount * 0.1) +
                                  ' VND',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: 'Total Payment: ',
                                color: CustomColor.black,
                                context: context,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            CustomText(
                              text: oCcy.format(
                                      (order.amount - order.amount * 0.1) +
                                          order.shippingFee +
                                          order.stairFee) +
                                  ' VND',
                              color: CustomColor.purple,
                              context: context,
                              fontSize: 17,
                              maxLines: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
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
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
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
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
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
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
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
    );
  }
}
