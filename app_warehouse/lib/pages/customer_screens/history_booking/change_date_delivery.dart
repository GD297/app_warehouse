import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_input.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChangeDateDelivery extends StatefulWidget {
  Order order;
  ChangeDateDelivery({@required this.order});
  @override
  _ChangeDateDeliveryState createState() => _ChangeDateDeliveryState();
}

class _ChangeDateDeliveryState extends State<ChangeDateDelivery> {
  Future<void> _selectDate(context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(days: 3)),
        firstDate: DateTime.now().add(Duration(days: 3)),
        lastDate: DateTime(2022));
  }

  final _reason = FocusNode();
  final _controllerReason = TextEditingController();
  String get _reasonText => _controllerReason.text;
  final oCcy = new NumberFormat("#,##0", "en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Date',
        ),
        backgroundColor: CustomColor.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
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
                      text: widget.order.id,
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
                          .format(widget.order.date),
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
                      text: "Delivery Date: ",
                      color: CustomColor.black,
                      context: context,
                      fontSize: 15,
                    ),
                    CustomText(
                      text: DateFormat()
                          .addPattern("dd MMM yyyy HH:mm:ss")
                          .format(widget.order.date.add(Duration(days: 3))),
                      color: CustomColor.black,
                      context: context,
                      fontSize: 15,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: Text(
                          'Change Date',
                          style: TextStyle(
                              color: CustomColor.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                CustomSizedBox(
                  context: context,
                  height: 10,
                ),
                Container(
                  color: CustomColor.white,
                  child: Divider(
                    thickness: 0.54,
                    color: Color(0xFF8D8D8D),
                  ),
                ),
                CustomText(
                    text: 'Please leave us a message',
                    color: Colors.black,
                    context: context,
                    fontSize: 15),
                CustomOutLineInput(
                  deviceSize: MediaQuery.of(context).size,
                  labelText: 'Reason',
                  isDisable: false,
                  focusNode: _reason,
                  nextNode: _reason,
                  controller: _controllerReason,
                ),
                Container(
                  child: CustomButton(
                      height: 40,
                      text: 'Request',
                      width: double.infinity,
                      textColor: CustomColor.white,
                      onPressFunction: () {
                        Navigator.pop(context);
                      },
                      buttonColor: CustomColor.purple,
                      borderRadius: 4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
