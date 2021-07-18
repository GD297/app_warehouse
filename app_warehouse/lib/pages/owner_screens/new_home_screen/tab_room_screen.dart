import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/owner_detail_room.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/owner_detail_storage.dart';
import 'package:flutter/material.dart';

class TabRoomScreen extends StatelessWidget {
  List<Map<String, dynamic>> listRoom = [
    {'id': 'Room A-01', 'totalOrder': '5', 'Usage': 70},
    {'id': 'Room A-02', 'totalOrder': '5', 'Usage': 40},
    {'id': 'Room A-03', 'totalOrder': '5', 'Usage': 50},
    {'id': 'Room A-04', 'totalOrder': '5', 'Usage': 20},
    {'id': 'Room A-05', 'totalOrder': '5', 'Usage': 30},
    {'id': 'Room A-06', 'totalOrder': '5', 'Usage': 100},
    {'id': 'Room A-07', 'totalOrder': '5', 'Usage': 80},
    {'id': 'Room A-08', 'totalOrder': '5', 'Usage': 10},
    {'id': 'Room A-09', 'totalOrder': '5', 'Usage': 0},
    {'id': 'Room A-10', 'totalOrder': '5', 'Usage': 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          CustomSizedBox(
            context: context,
            height: 20,
          ),
          for (int i = 0; i < listRoom.length; i = i + 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: MediaQuery.of(context).size.width / 2.2,
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 19),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 14,
                            offset: Offset(0, 6),
                            color: Colors.black.withOpacity(0.06))
                      ]),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: listRoom[i]['id'],
                            color: Colors.black,
                            context: context,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                        CustomSizedBox(
                          context: context,
                          height: 15,
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Total Orders:",
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: listRoom[i]['totalOrder'],
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                          ],
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Usage:",
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: listRoom[i]['Usage'].toString() + '%',
                              color: listRoom[i]['Usage'] > 70 ||
                                      listRoom[i]['Usage'] == 100
                                  ? CustomColor.red
                                  : listRoom[i]['Usage'] > 50 &&
                                          listRoom[i]['Usage'] <= 70
                                      ? Colors.yellow[700]
                                      : Colors.green,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                          ],
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OwnerDetailRoom(),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: CustomColor.purple,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: MediaQuery.of(context).size.width / 2.2,
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 19),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 14,
                            offset: Offset(0, 6),
                            color: Colors.black.withOpacity(0.06))
                      ]),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: listRoom[i + 1]['id'],
                            color: Colors.black,
                            context: context,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                        CustomSizedBox(
                          context: context,
                          height: 15,
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Total Orders:",
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: listRoom[i + 1]['totalOrder'],
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                          ],
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Usage:",
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: listRoom[i + 1]['Usage'].toString() + '%',
                              color: listRoom[i + 1]['Usage'] > 70 ||
                                      listRoom[i + 1]['Usage'] == 100
                                  ? CustomColor.red
                                  : listRoom[i + 1]['Usage'] > 50 &&
                                          listRoom[i + 1]['Usage'] < 70
                                      ? Colors.yellow[700]
                                      : Colors.green,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                          ],
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OwnerDetailRoom(),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: CustomColor.purple,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
