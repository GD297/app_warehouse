import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/history_booking/request_order_screen.dart';
import 'package:app_warehouse/pages/customer_screens/notification_screen/detail_notification_screen.dart';
import 'package:app_warehouse/pages/owner_screens/bill/order_customer_screen.dart';
import 'package:app_warehouse/pages/owner_screens/bill/order_customer_widget.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/order_customer_qr.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum StatusBill { PAID, DELIVERIED, CHECK_OUT, TIME_OUT }
enum StatusNotifcation { NEW, OLD }

class NotificationScreen extends StatelessWidget {
  Widget _buildBillWidget(
      {@required List<Order> order,
      @required Map<String, dynamic> data,
      @required Map<String, dynamic> dataBill,
      @required BuildContext context,
      @required Size deviceSize}) {
    Color colorStatus;
    String status;
    switch (data['status']) {
      case StatusNotifcation.NEW:
        {
          colorStatus = CustomColor.green;
          status = 'New';
          break;
        }
      default:
        {
          status = "";
          break;
        }
    }
    Color colorTitle;

    switch (data['title']) {
      case 'Paid':
        {
          colorTitle = CustomColor.green;
          break;
        }
      case 'Warning!':
        {
          colorTitle = Colors.yellow[800];
          break;
        }
      case 'Expired!':
        {
          colorTitle = Colors.red[900];
          break;
        }
      case 'Delivered':
        {
          colorTitle = CustomColor.purple;
          break;
        }
      case 'Checkout':
        {
          colorTitle = CustomColor.purple;
          break;
        }
      default:
        {
          status = "";
          break;
        }
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RequestOrderCusScreen(
                      listOrder: [order[0]],
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
                          Container(
                            width: deviceSize.width / 1.28,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: data['title'],
                                  color: colorTitle,
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: status,
                                  color: colorStatus,
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          CustomSizedBox(
                            context: context,
                            height: 8,
                          ),
                          CustomText(
                            text: data['content'],
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
                            text: DateFormat()
                                .addPattern("dd/MM/yyyy")
                                .format(DateTime.now()),
                            color: CustomColor.black,
                            context: context,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ],
                      ),
                    ])),
              ])),
    );
  }

  List<Map<String, dynamic>> data1 = [
    {
      'title': 'Paid',
      'content': 'Your order #00111 have been completed',
      'date': '18/06/2021',
      'status': StatusNotifcation.NEW,
    },
    {
      'title': 'Paid',
      'content': 'Your order #00112 have been completed',
      'date': '17/06/2021',
      'status': StatusNotifcation.NEW,
    },
    {
      'title': 'Delivered',
      'content': 'Your order #00114 has delivered',
      'date': '15/06/2021',
      'status': StatusNotifcation.OLD,
    },
    {
      'title': 'Checkout',
      'content': 'Your order #00114 has Checkout',
      'date': '15/06/2021',
      'status': StatusNotifcation.OLD,
    },
    {
      'title': 'Warning!',
      'content': 'Your order #00113 will expire in 1 week',
      'date': '15/06/2021',
      'status': StatusNotifcation.OLD,
    },
    {
      'title': 'Expired!',
      'content': 'Your order #00114 has expired',
      'date': '15/06/2021',
      'status': StatusNotifcation.OLD,
    },
  ];
  List<Map<String, dynamic>> data = [
    {
      'orderId': '#00111',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': 'Not yet',
      'status': StatusBill.PAID,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'name': 'Lakeview self storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
    },
    {
      'orderId': '#00112',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '13/07/2021',
      'status': StatusBill.DELIVERIED,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'name': 'USA self Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
    },
    {
      'orderId': '#00113',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '05/30/2021',
      'status': StatusBill.TIME_OUT,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'name': 'Chalmetter super Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
    },
    {
      'orderId': '#00114',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '05/30/2021',
      'status': StatusBill.CHECK_OUT,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'name': 'MountainView Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
    },
    {
      'orderId': '#00115',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '05/30/2021',
      'status': StatusBill.DELIVERIED,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'name': 'MountainView Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
    },
    {
      'orderId': '#00116',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate': '05/30/2021',
      'status': StatusBill.DELIVERIED,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'name': 'MountainView Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final order = Provider.of<Orders>(context);
    final orders = order.orders;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(children: [
        CustomSizedBox(
          context: context,
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              return _buildBillWidget(
                  order: orders,
                  data: data1[index],
                  context: context,
                  deviceSize: deviceSize,
                  dataBill: data[index]);
            },
            itemCount: data1.length,
          ),
        ),
        CustomSizedBox(
          context: context,
          height: 32,
        )
      ]),
    );
  }
}
