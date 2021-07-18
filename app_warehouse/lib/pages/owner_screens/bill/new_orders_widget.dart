import 'package:app_warehouse/common/custom_app_bar_owner_logo.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/history_booking/history_booking_screen.dart';
import 'package:app_warehouse/pages/owner_screens/bill/detail_bill_screen.dart';
import 'package:app_warehouse/pages/owner_screens/bill/request_order_screen.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum StatusBill { PAID, DELIVERIED, CHECK_OUT, TIME_OUT }

class NewOrderWidget extends StatelessWidget {
  Map<String, dynamic> order;
  NewOrderWidget({@required this.order});
  Widget _buildBillWidget(
      {@required Map<String, dynamic> data,
      @required BuildContext context,
      @required Size deviceSize,
      @required List<Order> order}) {
    Color colorStatus;
    String status;
    switch (data['status']) {
      case '':
        {
          colorStatus = CustomColor.green;
          status = '';
          break;
        }
      case "Paid":
        {
          colorStatus = CustomColor.purple;
          status = '';
          break;
        }
      case "Time Out":
        {
          colorStatus = CustomColor.red;
          status = '';
          break;
        }
      case "New":
        {
          colorStatus = CustomColor.green;
          status = 'New';
          break;
        }
      default:
        {
          colorStatus = CustomColor.blue;
          status = '';
          break;
        }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    RequestOrderOwnerScreen(listOrder: [order[0]])));
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
                      CustomSizedBox(
                        context: context,
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Order No ' + data['orderId'],
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
                            text: data['customerName'],
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16,
                          ),
                          CustomSizedBox(
                            context: context,
                            height: 8,
                          ),
                        ],
                      ),
                    ])),
            Column(
              children: [
                CustomText(
                  text: status,
                  color: colorStatus,
                  context: context,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.right,
                ),
                CustomSizedBox(
                  context: context,
                  height: 56,
                ),
                CustomText(
                  text: DateFormat()
                      .addPattern("dd-MM-yyyy")
                      .format(DateTime.now()),
                  color: Colors.black38,
                  context: context,
                  fontSize: 16,
                ),
                CustomSizedBox(
                  context: context,
                  width: 56,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final order1 = Provider.of<Orders>(context);
    List<Order> listOrder = order1.orders;
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        _buildBillWidget(
            data: order,
            context: context,
            deviceSize: deviceSize,
            order: listOrder),
      ],
    );
  }
}
