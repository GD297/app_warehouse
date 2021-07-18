import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/provider/item_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemFewWidget extends StatelessWidget {
  final ItemInCart data;
  final bool isTotal;
  ItemFewWidget({this.data, @required this.isTotal});
  final oCcy = new NumberFormat("#,##0", "en_US");
  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 5,
                    child: Image.asset(
                      data.productItem.imagePath,
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 5,
                    )),
                CustomSizedBox(
                  context: context,
                  width: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: data.typeItem == 'FewServices'
                            ? data.productItem.name +
                                ' (' +
                                data.productItem.listSize[0].values.first +
                                ')'
                            : data.productItem.name,
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
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                    text: 'Qty: ' + data.quantity.toString(),
                                    color: CustomColor.black,
                                    fontWeight: FontWeight.bold,
                                    context: context,
                                    fontSize: 13),
                                Container(
                                  child: CustomText(
                                    text: oCcy
                                            .format(data.productItem.price)
                                            .toString() +
                                        ' VND',
                                    textAlign: TextAlign.right,
                                    color: CustomColor.purple,
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
          isTotal
              ? Column(
                  children: [
                    Container(
                      color: CustomColor.white,
                      child: Divider(
                        thickness: 0.54,
                        color: Color(0xFF8D8D8D),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: 'Total (x' +
                                      data.quantity.toString() +
                                      '): ',
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 16),
                              CustomText(
                                text: (data.quantity * data.productItem.price)
                                        .toString() +
                                    ' VND',
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
              : Container()
        ],
      ),
    );
  }
}
