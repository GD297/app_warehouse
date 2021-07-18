import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/for_rent_detail/detail_storage_for_rent.dart';
import 'package:app_warehouse/pages/customer_screens/self_storage_screen/self_storage_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class BestItemSelfStorageWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final Size deviceSize;
  BestItemSelfStorageWidget({@required this.data, @required this.deviceSize});
  List<Map<String, dynamic>> mockUpStorageData = [
    {
      'imagePath': 'assets/images/storage1.png',
      'name': 'Storage 2m2',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
      'size': '1m x 2m x 2.5m',
      'distance': '2',
      'area': '2m2',
      'price': "600,000 VND"
    },
    {
      'imagePath': 'assets/images/storage2.png',
      'name': 'Storage 4m2',
      'address': '12, Cach Mang Thang 8, 10 District, Ward 5, Ho Chi Minh City',
      'rating': 4.5,
      'size': '2m x 2m x 2.5m',
      'distance': 4,
      'area': '4m2',
      'price': "1,000,000 VND"
    },
    {
      'imagePath': 'assets/images/storage3.png',
      'name': 'Storage 8m2',
      'address': '12, Gia Phu, 10 District, Ward 5, Ho Chi Minh City',
      'rating': 5,
      'size': '2m x 4m x 2.5m',
      'distance': 11,
      'area': '8m2',
      'price': "1,600,000 VND"
    },
    {
      'imagePath': 'assets/images/storage4.png',
      'name': 'Storage 16m2',
      'address': '12, Kim Bien, 10 District, Ward 5, Ho Chi Minh City',
      'rating': 4,
      'size': '4m x 4m x 2.5m',
      'distance': 12,
      'area': '16m2',
      'price': "2,800,000 VND"
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<String> listItemContain = data['itemContains'];

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelfStorageScreen(
                      data: mockUpStorageData[0],
                    )),
          );
        },
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
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
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: CustomText(
                            text: data['name'],
                            color: CustomColor.black,
                            textAlign: TextAlign.start,
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: Container(
                              child: Image.asset(
                                data['imagePath'],
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Text(
                                  data['newPrice'],
                                  style: TextStyle(
                                      color: CustomColor.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data['unit'],
                                  style: TextStyle(
                                      color: CustomColor.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomSizedBox(
                          height: 8,
                          context: context,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: CustomText(
                            text: data['decription'],
                            color: CustomColor.black[2],
                            context: context,
                            maxLines: 10,
                            fontSize: 14,
                          ),
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 10,
                        ),
                        Container(
                          width: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < listItemContain.length; i++)
                                Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: CustomText(
                                    text:
                                        "\t\t\t\t\t\t - " + listItemContain[i],
                                    color: CustomColor.black[2],
                                    context: context,
                                    maxLines: 10,
                                    fontSize: 14,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 5,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
