import 'package:app_warehouse/pages/customer_screens/self_storage_screen/self_storage_items.dart';
import 'package:flutter/material.dart';

class AllSelfStorageWidget extends StatelessWidget {
  String mq = String.fromCharCode(0x00B2);
  static List<Map<String, dynamic>> mockUpSelfStorateData = [
    {
      'imagePath': 'assets/images/2m2final2.png',
      'name': 'Storage 2m' + String.fromCharCode(0x00B2),
      'decription': 'Used to store small furniture,\nsmall quantity:',
      'price': "",
      'newPrice': "600.000 VND/ month",
      'size': '2m x 4m x 2,5m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '6 boxes of 86m3',
        '1 student desk',
        '1 student seat',
        '1 mini bike'
      ],
    },
    {
      'imagePath': 'assets/images/4m2.png',
      'name': 'Storage 4m' + String.fromCharCode(0x00B2),
      'decription': 'Tương đương kho lưu trữ nhỏ:',
      'price': "",
      'newPrice': "1.000.000 VND / month",
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '9 bins of 86m3',
        '1 dining table',
        '4 dining chairs',
        '1 bike',
        '1 single mattress',
        '1 sofa'
      ],
    },
    {
      'imagePath': 'assets/images/8m2.png',
      'name': 'Storage 8m' + String.fromCharCode(0x00B2),
      'decription':
          'Suitcase size M < 70L/ Microwave/ Clothes box < 25kg/ Standing fan/ Baby stroller..',
      'price': "",
      'newPrice': '1,600.000 VND / month',
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '12 bins 86m' + String.fromCharCode(0x00B3),
        '1 dining table',
        '4 dining chairs',
        '2 bicycles',
        '1 queen/king mattress',
        '1 set of sofa table',
        '1 coffee table',
        '1 refrigerator 1 door',
        '1 TV',
        '1 small bookshelf',
        '1 small wardrobe ',
      ],
    },
    {
      'imagePath': 'assets/images/16m2.png',
      'name': 'Storage 16m' + String.fromCharCode(0x00B2),
      'decription':
          'Suitcase size L/ Air conditioner/ Bicycle/ Refrigerator 90L/ Folding mattress 1.6/ Single sofa...',
      'price': "",
      'newPrice': "2,800.000 VND / month",
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '18 bins 86m' + String.fromCharCode(0x00B3),
        '1 dining table',
        '1 set of large tables and chairs',
        '4 dining chairs',
        '4 bicycles',
        '2 queen/king mattress',
        '1 set of sofa table',
        '1 set coffee tables and chairs',
        '1 2-door refrigerator',
        '1 large TV',
        '1 large bookshelf',
        '1 large wardrobe',
        '1 dressing table '
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (_, index) {
          return SelfStorageItem(
            listServices: mockUpSelfStorateData[index],
          );
        },
        itemCount: mockUpSelfStorateData.length,
      ),
    );
  }
}
