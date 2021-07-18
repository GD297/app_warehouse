import 'package:app_warehouse/pages/customer_screens/new_home_screen/best_item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class MostUsedServiceWidget extends StatelessWidget {
  List<Map<String, dynamic>> mockUpKeepRentalsFewData = [
    {
      'imagePath': 'assets/images/thungbolo.png',
      'name': 'Bolo Box',
      'decription': 'Can hold 25 pairs of shoes/clothes/80 books/...',
      'price': "",
      'newPrice': "100.000 VND / month",
      'service': [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'item': [
        {'Size': '60cm x 40cm x 36cm'},
        {'Volume': '80L'},
        {'x1 Styrofoam': '165,000 VND'}
      ]
    },
    {
      'imagePath': 'assets/images/sizem.png',
      'name': 'Size M',
      'decription':
          'Suitcase size M < 70L/ Microwave/ Clothes box < 25kg/ Standing fan/ Baby stroller..',
      'price': "",
      'newPrice': "100.000 VND / month",
      'item': [
        {'Weight': 'Less than 25kg'},
        {'Side length': 'Less than 100cm'},
        {'Carrying': '1 person carrying'}
      ]
    },
    {
      'imagePath': 'assets/images/sizexl.png',
      'name': 'Size XL',
      'decription':
          'Refrigerator < 250 L/ Bed frame/ TV < 50 Inch/ 1.6m folding mattress...',
      'price': "",
      'newPrice': "200.000 VND / month",
      'item': [
        {'Weight': 'Less than 40kg'},
        {'Side length': 'Less than 160cm'},
        {'Carrying': '2 person carrying'}
      ]
    },
  ];

  final Size deviceSize;
  MostUsedServiceWidget({@required this.deviceSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return BestItemWidget(
              data: mockUpKeepRentalsFewData[index], deviceSize: deviceSize);
        },
        itemCount: mockUpKeepRentalsFewData.length,
      ),
    );
  }
}
