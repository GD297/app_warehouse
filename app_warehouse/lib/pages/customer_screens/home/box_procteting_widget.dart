import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/for_rent_detail/detail_box_protecting_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';

class BoxProtectingWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final Size deviceSize;
  final List<Tag> _tags = [
    Tag(
      id: 1,
      title: "Upto 10% Discount when rent over 3 months",
      active: false,
    ),
  ];
  BoxProtectingWidget({@required this.data, @required this.deviceSize});

  String _shippingFee(int distance) {
    if (distance.toInt() < 10) {
      return data['shippingPrice'][0]["10km"] + "/10km";
    } else {
      return data['shippingPrice'][1]["15km"] + "/15km";
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listPrice = data['listBoxPrice'];
    List<Map<String, dynamic>> listPriceFloor = data['pricePerFloor'];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailProtectingServiceScreen(
                    data: data,
                  )),
        );
      },
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          height: 509,
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
              Expanded(
                flex: 0,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (_, index) {
                      var box = listPrice[index].keys.toList()[0];
                      var price = listPrice[index][box];
                      return Column(
                        children: [
                          Container(
                            // color: Colors.pinkAccent,
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: 16,
                                        height: 16,
                                        child: Image.asset(
                                          'assets/images/box.png',
                                          fit: BoxFit.cover,
                                        )),
                                    CustomSizedBox(
                                      context: context,
                                      width: 4,
                                    ),
                                    CustomText(
                                        text: box == "0,5m x 1m x 1m"
                                            ? "Box Size-S"
                                            : "Box Size-L",
                                        color: CustomColor.black,
                                        context: context,
                                        fontSize: 16),
                                  ],
                                ),
                                CustomText(
                                    text: "${price}/month",
                                    color: CustomColor.purple,
                                    fontWeight: FontWeight.bold,
                                    context: context,
                                    fontSize: 16),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.pink,
                            margin: const EdgeInsets.fromLTRB(18, 0, 0, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: 16,
                                        height: 16,
                                        child: Image.asset(
                                          'assets/images/floor.png',
                                          fit: BoxFit.cover,
                                        )),
                                    CustomSizedBox(
                                      context: context,
                                      width: 4,
                                    ),
                                    CustomText(
                                        text: "Go with stair",
                                        color: CustomColor.black,
                                        context: context,
                                        fontSize: 16),
                                  ],
                                ),
                                CustomText(
                                    text: "5000 VND/stair",
                                    color: CustomColor.purple,
                                    fontWeight: FontWeight.bold,
                                    context: context,
                                    fontSize: 16),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.pink,
                            margin: const EdgeInsets.fromLTRB(18, 0, 0, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: 16,
                                        height: 16,
                                        child: Image.asset(
                                          'assets/images/elevator.png',
                                          fit: BoxFit.cover,
                                        )),
                                    CustomSizedBox(
                                      context: context,
                                      width: 4,
                                    ),
                                    CustomText(
                                        text: "Go with elevator",
                                        color: CustomColor.black,
                                        context: context,
                                        fontSize: 16),
                                  ],
                                ),
                                CustomText(
                                    text: "35,000 VND",
                                    color: CustomColor.purple,
                                    fontWeight: FontWeight.bold,
                                    context: context,
                                    fontSize: 16),
                              ],
                            ),
                          ),
                          CustomSizedBox(
                            context: context,
                            height: 8,
                          ),
                        ],
                      );
                    },
                    itemCount: listPrice.length),
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
                          'assets/images/shippingtruck.png',
                          width: 20,
                          height: 20,
                        )),
                        CustomSizedBox(
                          context: context,
                          width: 4,
                        ),
                        CustomText(
                            text: "Shipping Fee",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16),
                      ],
                    ),
                    CustomText(
                        text: _shippingFee(
                            int.parse(data['distance'].toString())),
                        color: CustomColor.purple,
                        fontWeight: FontWeight.bold,
                        context: context,
                        fontSize: 16),
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
