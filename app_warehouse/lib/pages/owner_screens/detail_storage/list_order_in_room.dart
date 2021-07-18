import 'package:app_warehouse/common/custom_app_bar_owner_logo.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/bill/order_customer_screen.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum StatusBill { PAID, DELIVERIED, CHECK_OUT, TIME_OUT }

class ListOrderInRoom extends StatelessWidget {
  Widget _buildBillWidget(
      {@required Map<String, dynamic> data,
      @required List<Order> listOrder,
      @required BuildContext context,
      @required Size deviceSize}) {
    Color colorStatus;
    String status;
    switch (data['status']) {
      case StatusBill.CHECK_OUT:
        {
          colorStatus = CustomColor.green;
          status = 'Check out';
          break;
        }
      case StatusBill.PAID:
        {
          colorStatus = CustomColor.purple;
          status = 'Paid';
          break;
        }
      case StatusBill.TIME_OUT:
        {
          colorStatus = CustomColor.red;
          status = 'Time out';
          break;
        }
      default:
        {
          colorStatus = CustomColor.blue;
          status = 'Deliveried';
          break;
        }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => OrderCustomerScreen(
                  isStorage: false,
                  inRoom: false,
                      listOrder: [listOrder[0]],
                    )));
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                                text: data['orderId'],
                                color: CustomColor.black,
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomSizedBox(
                                context: context,
                                height: 8,
                              ),
                              CustomText(
                                text: data['storageName'],
                                color: CustomColor.black,
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomSizedBox(
                                context: context,
                                height: 8,
                              ),
                              CustomText(
                                  text: 'Expired Date: ' + data['expiredDate'],
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 14),
                            ],
                          ),
                        ])),
                Column(
                  children: [
                    CustomText(
                      text: data['price'],
                      color: CustomColor.purple,
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )
              ])),
    );
  }

  List<Map<String, dynamic>> data = [
    {
      'orderId': '#2307202122',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': 'Not yet',
      'status': StatusBill.PAID,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName': 'Keep Item'
    },
    {
      'orderId': '#2307202123',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '13/07/2021',
      'status': StatusBill.DELIVERIED,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName': 'Keep Item'
    },
    {
      'orderId': '#2307202120',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '05/30/2021',
      'status': StatusBill.TIME_OUT,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName': 'Keep Item'
    },
    {
      'orderId': '#2307202119',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '05/30/2021',
      'status': StatusBill.CHECK_OUT,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName': 'Box Bolo'
    },
    {
      'orderId': '#2307202119',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '05/30/2021',
      'status': StatusBill.CHECK_OUT,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName': 'Box Bolo'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final order = Provider.of<Orders>(context);
    List<Order> listOrder = order.orders;
    return Column(
      children: [
        for (int index = 0; index < data.length; index++)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _buildBillWidget(
                listOrder: listOrder,
                data: data[index],
                context: context,
                deviceSize: deviceSize),
          ),
        CustomSizedBox(
          context: context,
          height: 32,
        )
      ],
    );
  }
}
