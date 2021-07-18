import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/provider/item_cart.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemComboOrder extends StatelessWidget {
  final Order data;
  final ItemInCart comboItem;
  final bool isModify;
  ItemComboOrder({this.data, this.isModify, @required this.comboItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: 70,
            width: 70,
            child: Image.asset(
              comboItem.productItem.imagePath,
              height: 50,
              width: 50,
            )),
        CustomSizedBox(
          context: context,
          width: 32,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: comboItem.productItem.name,
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
              text: comboItem.productItem.price.toString(),
              color: CustomColor.purple,
              context: context,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            CustomSizedBox(
              context: context,
              height: 8,
            ),
            Row(
              children: [
                CustomText(
                    text: 'Amount: ',
                    color: CustomColor.black,
                    context: context,
                    fontSize: 16),
                CustomText(
                  text: comboItem.quantity.toString(),
                  color: CustomColor.purple,
                  context: context,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
