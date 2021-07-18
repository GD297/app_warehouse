import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/history_booking/request_order_screen.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ListHistory extends StatelessWidget {
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
  final oCcy = new NumberFormat("#,##0", "en_US");
  Widget _buildBillWidget({@required Order order, @required context}) {
    Color colorStatus;
    String status;
    Color colorTitle;

    switch (order.status) {
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
    String type;
    if (order.typeOrder == 'FewServices' || order.typeOrder == 'MuchServices') {
      type = 'Keep property';
    } else if (order.typeOrder == 'Combo') {
      type = 'Combo';
    } else {
      type = 'Self-Storage';
    }
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RequestOrderCusScreen(
                          listOrder: [order],
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
                      width: MediaQuery.of(context).size.width / 1.28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Order No." + order.id,
                            color: Colors.black,
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text: order.status,
                            color: colorTitle,
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: type,
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16,
                          ),
                          CustomSizedBox(
                            context: context,
                            height: 4,
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: 'Expired Date\n+' +
                                    DateFormat()
                                        .addPattern("dd/MM/yyyy")
                                        .format(order.expiredDate),
                                color: CustomColor.black,
                                context: context,
                                fontSize: 15,
                              ),
                              CustomText(
                                text: DateFormat()
                                    .addPattern("dd/MM/yyyy")
                                    .format(order.expiredDate),
                                color: CustomColor.black,
                                context: context,
                                fontSize: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: DateFormat()
                                .addPattern("dd/MM/yyyy")
                                .format(order.date),
                            color: CustomColor.black,
                            context: context,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                          CustomText(
                            text: oCcy.format(order.amount +
                                    order.shippingFee +
                                    order.stairFee) +
                                ' VND',
                            color: CustomColor.purple,
                            context: context,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        CustomSizedBox(
          context: context,
          height: 8,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final order = Provider.of<Orders>(context);
    List<Order> listOrder = order.orders;
    return Scaffold(
      appBar: AppBar(
        title: Text("History Booking"),
        backgroundColor: CustomColor.purple,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CustomSizedBox(
            context: context,
            height: 16,
          ),
          for (int i = listOrder.length - 1; i >= 0; i--)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _buildBillWidget(
                order: listOrder[i],
                context: context,
              ),
            ),
          CustomSizedBox(
            context: context,
            height: 60,
          )
        ]),
      ),
    );
  }
}
