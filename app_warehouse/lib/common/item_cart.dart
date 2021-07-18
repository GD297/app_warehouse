import 'package:app_warehouse/common/button_increase_quantity.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  final Map<String, String> data;
  final bool isModify;
  ItemCart({this.data, this.isModify});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: 70,
            width: 70,
            child: Image.asset(
              data['image'],
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
              text: data['name'],
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
              text: data['price'],
              color: CustomColor.purple,
              context: context,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            CustomSizedBox(
              context: context,
              height: 8,
            ),
            if (isModify == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonIncreaseWidget(
                    quantity: data['amount'],
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 40,
                  ),
                  CustomText(
                      text: 'Remove',
                      color: CustomColor.red,
                      context: context,
                      fontSize: 16),
                ],
              ),
            if (isModify == false)
              Row(
                children: [
                  CustomText(
                      text: 'Amount: ',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 16),
                  CustomText(
                    text: data['amount'],
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
