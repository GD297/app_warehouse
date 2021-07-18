import 'dart:ui';

import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/for_rent_detail/detail_storage_for_rent.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

class StorageProtectingWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final Size deviceSize;
  StorageProtectingWidget({@required this.data, @required this.deviceSize});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listPrice = data['listBoxPrice'];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailStorageServiceScreen(
                    data: data,
                  )),
        );
      },
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: CustomColor.white,
              border: Border.all(color: Color(0xFFe8e8e8)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 14,
                    offset: Offset(0, 6),
                    color: Color(0xFF000000).withOpacity(0.06))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Container(
                    width: deviceSize.width,
                    height: deviceSize.height / 5.2,
                    child: Image.asset(
                      data['imagePath'],
                      fit: BoxFit.cover,
                    )),
              ),
              CustomSizedBox(
                height: 16,
                context: context,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: data['name'],
                      color: CustomColor.black,
                      textAlign: TextAlign.start,
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                        child: Icon(
                          Icons.location_on,
                          color: CustomColor.purple,
                          size: 24.0,
                        ),
                      ),
                      Container(
                        child: CustomText(
                          text: "~${data['distance']}km",
                          color: CustomColor.black,
                          context: context,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 8,
              ),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CustomText(
                      text: data['address'],
                      color: CustomColor.black[2],
                      context: context,
                      maxLines: 2,
                      fontSize: 14)),
              CustomSizedBox(
                context: context,
                height: 12,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: RatingBarIndicator(
                      rating: data['rating'] * 1.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Color(0xFFFFCC1F),
                      ),
                      itemCount: 5,
                      itemSize: 18,
                      direction: Axis.horizontal,
                    ),
                  ),
                  CustomText(
                      text: "(10)",
                      color: Color(0XFFb6b6b6),
                      fontWeight: FontWeight.bold,
                      context: context,
                      fontSize: 12),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    child: Image.asset(
                      'assets/images/sale.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 7,
                  ),
                  Container(
                    child: CustomText(
                      text: "Upto 10% Discount when rent over 3 months",
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      context: context,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/full-size.png',
                          width: 20,
                          height: 20,
                        )),
                        CustomSizedBox(
                          context: context,
                          width: 12,
                        ),
                        CustomText(
                            text: "Storage Size",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16),
                      ],
                    ),
                    CustomText(
                        text: data["size"],
                        color: CustomColor.purple,
                        fontWeight: FontWeight.bold,
                        context: context,
                        fontSize: 16),
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/area.png',
                          width: 25,
                          height: 25,
                        )),
                        CustomSizedBox(
                          context: context,
                          width: 7,
                        ),
                        CustomText(
                            text: "Storage Area",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16),
                      ],
                    ),
                    Row(
                      children: [
                        EasyRichText(
                          data['area'],
                          patternList: [
                            EasyRichTextPattern(
                                targetString: '2', superScript: true),
                          ],
                          defaultStyle: TextStyle(
                              color: CustomColor.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/price.png',
                          width: 20,
                          height: 20,
                        )),
                        CustomSizedBox(
                          context: context,
                          width: 13,
                        ),
                        CustomText(
                            text: "Price",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16),
                      ],
                    ),
                    CustomText(
                      text: data['price'] == 'Contact for price'
                          ? data['price']
                          : data['price'] + "/month",
                      color: CustomColor.purple,
                      fontWeight: FontWeight.bold,
                      context: context,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
