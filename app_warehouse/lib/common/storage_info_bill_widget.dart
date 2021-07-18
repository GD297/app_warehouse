import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';

class StorageInfoBillWidget extends StatelessWidget {
  final String price;
  final String imagePath;
  final String size;
  final String title;
  final bool discount;
  final String available;

  StorageInfoBillWidget(
      {@required this.price,
      @required this.imagePath,
      @required this.size,
      @required this.title,
      @required this.discount,
      @required this.available});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: deviceSize.width / 3,
                height: deviceSize.height / 5.5,
                child: Center(
                    child: Image.asset(
                  imagePath,
                )),
                decoration: BoxDecoration(
                  color: CustomColor.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 14,
                        color: Color(0x000000).withOpacity(0.06),
                        offset: Offset(0, 6)),
                  ],
                ),
              ),
            ],
          ),
          CustomSizedBox(
            context: context,
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    color: CustomColor.black,
                    context: context,
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomSizedBox(
                    context: context,
                    height: 9,
                  ),
                  CustomText(
                    color: CustomColor.black[2],
                    context: context,
                    text: "Size: ${size}",
                    fontSize: 16,
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    child: Image.asset("assets/images/dollar.png"),
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 5,
                  ),
                  CustomText(
                    text: price,
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 4,
                  ),
                  CustomText(
                    text: '|' + '',
                    color: CustomColor.black,
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 4,
                  ),
                  CustomText(
                    text: 'month',
                    color: CustomColor.black[1],
                    context: context,
                    fontSize: 12,
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: 'Amount: ',
                      color: CustomColor.black,
                      context: context,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  CustomSizedBox(
                    context: context,
                    width: 10,
                  ),
                  CustomText(
                    text: '1',
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
      ),
    );

  }
}
