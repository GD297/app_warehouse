import 'package:app_warehouse/pages/customer_screens/new_home_screen/combo_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SpecialComboWidget extends StatelessWidget {
  List<Map<String, dynamic>> mockUpComboData = [
    {
      'id': 'CB1',
      'imagePath': 'assets/images/storage1.png',
      'name': 'Combo Keep Rental 3 months',
      'decription': 'Allowable weight upto 25kg and some accessories',
      'detail': '',
      'price': "510,000 VND",
      'newPrice': '459,000 VND',
      'sale': '10%',
      'item': [
        {'x1 Box-Bolo': '300,000 VND/3 month'},
        {'x1 Tape': '45,000 VND'},
        {'x1 Styrofoam': '165,000 VND'}
      ],
      'itemimage': [
        'assets/images/thungbolo.png',
        'assets/images/icon_bangkeo.png',
        'assets/images/icon_mangpe.png'
      ]
    },
    {
      'id': 'CB2',
      'imagePath': 'assets/images/storage1.png',
      'name': 'Combo Self Storage 3 months',
      'decription': 'Size storage 2m x 2m x 2,5m',
      'price': "510,000 VND",
      'newPrice': '459,000 VND',
      'sale': '10%',
      'item': [
        {'x1 Storage 4m2': '3,000,000 VND/3 month'},
        {'x1 Tape': '45,000 VND'},
        {'x1 Locks': '165,000 VND'},
        {'x2 Carton-Box': '25,000 VND'},
      ],
      'itemimage': [
        'assets/images/4m2.png',
        'assets/images/icon_bangkeo.png',
        'assets/images/icon_okhoa.png',
        "assets/images/thungcarton.png"
      ]
    },
    {
      'id': 'CB3',
      'imagePath': 'assets/images/storage1.png',
      'name': 'Combo-Box 1',
      'decription': 'Allowable weight upto 25kg and some accessories',
      'price': "510,000 VND",
      'newPrice': '459,000 VND',
      'sale': '10%',
      'item': [
        {'x1 Box-Bolo': '300,000 VND/3 month'},
        {'x1 Tape': '45,000 VND'},
        {'x1 Locks': '165,000 VND'},
        {'x1 Styrofoam': '165,000 VND'}
      ],
      'itemimage': [
        'assets/images/thungbolos.png',
        'assets/images/icon_bangkeo.png',
        'assets/images/styrofoam.png',
        'assets/images/icon_okhoa.png'
      ]
    },
    {
      'id': 'CB4',
      'imagePath': 'assets/images/storage1.png',
      'name': 'Combo-Box 1',
      'decription': 'Allowable weight upto 25kg and some accessories',
      'price': "510,000 VND",
      'newPrice': '459,000 VND',
      'sale': '10%',
      'item': [
        {'x1 Box-Bolo': '300,000 VND/3 month'},
        {'x1 Tape': '45,000 VND'},
        {'x1 Locks': '165,000 VND'},
      ],
      'itemimage': [
        'assets/images/thungbolo.png',
        'assets/images/icon_bangkeo.png',
        'assets/images/icon_mangpe.png'
      ]
    },
  ];

  final Size deviceSize;
  SpecialComboWidget({@required this.deviceSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return ComboWidget(
              data: mockUpComboData[index], deviceSize: deviceSize);
        },
        itemCount: mockUpComboData.length,
      ),
    );
  }
}
