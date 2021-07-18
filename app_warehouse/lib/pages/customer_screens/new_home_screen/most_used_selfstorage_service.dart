import 'package:app_warehouse/pages/customer_screens/new_home_screen/best_item_selfstorage_widget.dart';

import 'package:flutter/material.dart';
import 'dart:ui';

class MostUsedSelfStorageServiceWidget extends StatelessWidget {
  final List<Map<String, dynamic>> mockUpKeepRentalsFewData = [
    {
      'imagePath': 'assets/images/2m2final2.png',
      'name': 'Storage 2m2',
      'decription': 'Used to store small furniture,\nsmall quantity:',
      'price': "",
      'newPrice': "600.000 VND/",
      'unit': 'month',
      'service': [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'itemContains': [
        '6 boxes of 86m3',
        '1 student desk',
        '1 student seat',
        '1 mini bike'
      ],
    },
    {
      'imagePath': 'assets/images/4m2.png',
      'name': 'Storage 4m2',
      'decription': 'Small repository equivalent:',
      'price': "",
      'newPrice': "1.000.000 VND /",
      'unit': 'month',
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
      'name': 'Storage 8m2',
      'decription': 'SThe equivalent of a room\n   can store: ',
      'price': "",
      'newPrice': "100.000 VND /",
      'unit': 'month',
      'itemContains': [
        '12 bins 86m3',
        '4 dining tables',
        '4 dining chairs',
        '2 bicycles',
        '1 queen/king mattress',
        '1 coffee table',
      ],
    },
  ];
  List<Map<String, dynamic>> mockUpSelfStorateData = [
    {
      'imagePath': 'assets/images/2m2final2.png',
      'name': 'Storage 2m2',
      'decription': 'Used to store small furniture,\nsmall quantity:',
      'price': "",
      'newPrice': "600.000 VND/",
      'unit': 'month',
      'service': [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'itemContains': [
        '6 boxes of 86m3',
        '1 student desk',
        '1 student seat',
        '1 mini bike'
      ],
    },
    {
      'imagePath': 'assets/images/4m2.png',
      'name': 'Storage 4m2',
      'decription': 'Tương đương kho lưu trữ nhỏ:',
      'price': "",
      'newPrice': "1.000.000 VND /",
      'unit': 'month',
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
      'name': 'Storage 8m2',
      'decription':
          'Suitcase size M < 70L/ Microwave/ Clothes box < 25kg/ Standing fan/ Baby stroller..',
      'price': "",
      'newPrice': "100.000 VND /",
      'unit': 'month',
      'itemContains': [
        '6 thùng 86m3',
        '1 bàn học sinh',
        '1 ghế học sinh',
        '1 xe đạp nhỏ'
      ],
    },
    {
      'imagePath': 'assets/images/16m2.png',
      'name': 'Storage 16m2',
      'decription':
          'Suitcase size L/ Air conditioner/ Bicycle/ Refrigerator 90L/ Folding mattress 1.6/ Single sofa...',
      'price': "",
      'newPrice': "150.000 VND / month",
      'item': [
        {'Weight': 'Less than 32kg'},
        {'Side length': 'Less than 130cm'},
        {'Carrying': '1 person carrying'}
      ]
    },
  ];
  final Size deviceSize;
  MostUsedSelfStorageServiceWidget({@required this.deviceSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: MediaQuery.of(context).size.height / 3.1,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return BestItemSelfStorageWidget(
              data: mockUpKeepRentalsFewData[index], deviceSize: deviceSize);
        },
        itemCount: mockUpKeepRentalsFewData.length,
      ),
    );
  }
}
