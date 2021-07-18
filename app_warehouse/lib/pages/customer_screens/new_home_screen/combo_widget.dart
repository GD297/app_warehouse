import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/details_combo_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';

class ComboWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final Size deviceSize;
  ComboWidget({@required this.data, @required this.deviceSize});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listPrice = data['item'];
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailComboScreen(
                      data: data,
                      deviceSize: deviceSize,
                    )),
          );
        },
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
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
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Container(
                        width: deviceSize.width,
                        height: deviceSize.height / 5.2,
                        child: Image.asset(
                          data['imagePath'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Image.asset(
                        'assets/images/10-discount.png',
                        height: 55,
                        width: 55,
                      ),
                    )
                  ],
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
                    ],
                  ),
                ),
                CustomSizedBox(
                  context: context,
                  height: 8,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: RatingBarIndicator(
                        rating: 5 * 1.0,
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
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: CustomText(
                    text: data['decription'],
                    color: CustomColor.black[2],
                    context: context,
                    maxLines: 2,
                    fontSize: 14,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 5,
                      ),
                      child: Column(
                        children: [
                          if (index < 3)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                    text: "\t - " + listPrice[index].keys.first,
                                    color: CustomColor.black[2],
                                    context: context,
                                    maxLines: 2,
                                    fontSize: 13),
                                CustomText(
                                    text: listPrice[index].values.first,
                                    color: CustomColor.black[2],
                                    context: context,
                                    maxLines: 2,
                                    fontSize: 13),
                              ],
                            ),
                          CustomSizedBox(
                            context: context,
                            height: 4,
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: listPrice.length > 3 ? 4 : listPrice.length,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data['price'],
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            data['newPrice'],
                            style: TextStyle(
                                color: CustomColor.purple,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
