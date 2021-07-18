import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/bill/order_customer_screen.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

enum StatusBill { PAID, DELIVERIED, CHECK_OUT, TIME_OUT }

class ListOrder extends StatelessWidget {
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
                      inRoom: true,
                      listOrder: [listOrder[0]],
                    )));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
        child: Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Container(
                    width: deviceSize.width - 100,
                    child: CustomText(
                      text: data['storageName'],
                      color: CustomColor.black,
                      context: context,
                      maxLines: 2,
                      fontSize: 14,
                    ),
                  ),
                  CustomSizedBox(
                    context: context,
                    height: 10,
                  ),
                  Container(
                    width: deviceSize.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: data['expiredDate'],
                            color: CustomColor.black,
                            context: context,
                            fontSize: 14),
                        CustomText(
                            text: data['price'],
                            color: CustomColor.purple,
                            context: context,
                            fontSize: 17),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> data = [
    {
      'orderId': '#2307202122',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate':
          DateFormat().addPattern("dd-MM-yyyy").format(DateTime.now()),
      'status': StatusBill.PAID,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName':
          'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City'
    },
    {
      'orderId': '#2307202123',
      'customerName': 'Jessica Clarent',
      'price': '600,000 VND',
      'expiredDate':
          DateFormat().addPattern("dd-MM-yyyy").format(DateTime.now()),
      'status': StatusBill.DELIVERIED,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName':
          'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City'
    },
    {
      'orderId': '#2307202120',
      'customerName': 'Jessica Clarent',
      'price': '800,000 VND',
      'expiredDate':
          DateFormat().addPattern("dd-MM-yyyy").format(DateTime.now()),
      'status': StatusBill.TIME_OUT,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName':
          'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City'
    },
    {
      'orderId': '#2307202119',
      'customerName': 'Jessica Clarent',
      'price': '900,000 VND',
      'expiredDate':
          DateFormat().addPattern("dd-MM-yyyy").format(DateTime.now()),
      'status': StatusBill.CHECK_OUT,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName':
          'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City'
    },
    {
      'orderId': '#2307202119',
      'customerName': 'Jessica Clarent',
      'price': '700,000 VND',
      'expiredDate':
          DateFormat().addPattern("dd-MM-yyyy").format(DateTime.now()),
      'status': StatusBill.CHECK_OUT,
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
      'storageName':
          'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City'
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
