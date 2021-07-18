import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/list_order_in_storage.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/owner_detail_room.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/owner_detail_storage.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/owner_detail_storage_new.dart';
import 'package:flutter/material.dart';

class TabStorageScreen extends StatelessWidget {
  List<Map<String, dynamic>> listRoom = [
    {
      'id': 'Storage A-01',
      'totalOrder': '5',
      'expiredDate': '12/07/21',
      'status': 'Time Out'
    },
    {
      'id': 'Storage A-02',
      'totalOrder': '5',
      'expiredDate': 'Not Yet',
      'status': 'Available'
    },
    {
      'id': 'Storage A-03',
      'totalOrder': '5',
      'expiredDate': '20/08/21',
      'status': 'For Rent'
    },
    {
      'id': 'Storage A-04',
      'totalOrder': '5',
      'expiredDate': '20/08/21',
      'status': 'For Rent'
    },
    {
      'id': 'Storage A-05',
      'totalOrder': '5',
      'expiredDate': '20/08/21',
      'status': 'For Rent'
    },
    {
      'id': 'Storage A-06',
      'totalOrder': '5',
      'expiredDate': 'Not Yet',
      'status': 'Available'
    },
    {
      'id': 'Storage A-07',
      'totalOrder': '5',
      'expiredDate': 'Not Yet',
      'status': 'Available'
    },
    {
      'id': 'Storage A-08',
      'totalOrder': '5',
      'expiredDate': 'Not Yet',
      'status': 'Available'
    },
    {
      'id': 'Storage A-09',
      'totalOrder': '5',
      'expiredDate': 'Not Yet',
      'status': 'For Rent'
    },
    {
      'id': 'Storage A-10',
      'totalOrder': '5',
      'expiredDate': 'Not Yet',
      'status': 'For Rent'
    },
  ];
  int index = 0;
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
                              text: "Status:",
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: listRoom[i]['status'],
                              color: listRoom[i]['status'] == 'Available'
                                  ? CustomColor.green
                                  : listRoom[i]['status'] == 'Time Out'
                                      ? CustomColor.red
                                      : CustomColor.black,
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
                              text: "Expired:",
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: listRoom[i]['expiredDate'],
                              color: CustomColor.black,
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
                                  builder: (context) => OwnerDetailStorageNew(),
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
                              text: 'Status:',
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: listRoom[i + 1]['status'],
                              color: listRoom[i + 1]['status'] == 'Available'
                                  ? CustomColor.green
                                  : CustomColor.black,
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
                              text: "Expired:",
                              color: CustomColor.black,
                              fontWeight: FontWeight.w500,
                              context: context,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: listRoom[i + 1]['expiredDate'],
                              color: CustomColor.black,
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
                                  builder: (context) => OwnerDetailStorageNew(),
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
