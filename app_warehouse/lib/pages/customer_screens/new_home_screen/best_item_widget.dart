import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/keep_rentals_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class BestItemWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final Size deviceSize;
  BestItemWidget({@required this.data, @required this.deviceSize});
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
    List<Map<String, dynamic>> listPrice = data['item'];

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => KeepRentalScreen(
                      data: mockUpStorageData[0],
                    )),
          );
        },
        child: Stack(
          children: [
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
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: Container(
                      width: deviceSize.width,
                      height: deviceSize.height / 5.2,
                      child: Image.asset(
                        data['imagePath'],
                        fit: BoxFit.contain,
                      ),
                    ),
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
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: CustomText(
                          text: data['decription'],
                          color: CustomColor.black[2],
                          context: context,
                          maxLines: 2,
                          fontSize: 14)),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 16, right: 25),
                        child: Column(
                          children: [
                            if (index < 3)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      text: "\t -  " +
                                          listPrice[index].keys.first,
                                      color: CustomColor.black[2],
                                      context: context,
                                      maxLines: 2,
                                      fontSize: 14),
                                  CustomText(
                                      text: listPrice[index].values.first,
                                      color: CustomColor.black[2],
                                      context: context,
                                      maxLines: 2,
                                      fontSize: 14),
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
                  CustomSizedBox(
                    context: context,
                    height: 10,
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
                              ),
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
          ],
        ),
      ),
    );
  }
}
