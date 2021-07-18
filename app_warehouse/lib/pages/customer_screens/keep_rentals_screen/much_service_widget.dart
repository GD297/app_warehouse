import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/much_service_items.dart';
import 'package:flutter/material.dart';

class MuchServiceWidget extends StatelessWidget {
  String mq = String.fromCharCode(0x00B2);
  static List<Map<String, dynamic>> mockUpKeepRentalsFewData = [
    {
      'id': 'BM1',
      'imagePath': 'assets/images/area0.5m2.png',
      'name': 'Area 0.5m' + String.fromCharCode(0x00B2),
      'decription': 'Can hold 5 boxes of clothes',
      'price': "",
      'newPrice': "400.000 VND / month",
      'service': [
        {'OFFER FOR STUDENTS': '50,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'item': [
        {'Size': '0.5m x 1m x 2m'},
        {'Volume': '5 boxes of clothes'},
      ],
      'quantity': 0
    },
    {
      'id': 'BM2',
      'imagePath': 'assets/images/area1m2.png',
      'name': 'Area 1m' + String.fromCharCode(0x00B2),
      'decription':
          '1 boarding room: 5-6 clothes boxes, plastic cabinets, mirrors, folding tables...',
      'price': "",
      'newPrice': "750.000 VND / month",
      'service': [
        {'OFFER FOR STUDENTS': '100,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'item': [
        {'Size': '1m x 1m x 2m'},
      ],
      'quantity': 0
    },
    {
      'id': 'BM3',
      'imagePath': 'assets/images/area2m2.png',
      'name': 'Area 2m' + String.fromCharCode(0x00B2),
      'decription':
          '1 bedroom apartment: wedge, 8-10 wardrobes, refrigerator, desk, chair,... ',
      'price': "",
      'newPrice': "1,275.000 VND / month",
      'service': [
        {'OFFER FOR STUDENTS': '150,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'item': [
        {'Size': 'Less than 25kg'},
        {'Side length': 'Less than 100cm'},
        {'Carrying': '1 person carrying'}
      ],
      'quantity': 0
    },
    {
      'id': 'BM4',
      'imagePath': 'assets/images/area3m2.png',
      'name': 'Area 3m' + String.fromCharCode(0x00B2),
      'decription':
          '2-bedroom apartment: bed, 8-10 boxes of clothes, refrigerator, washing machine, air conditioner, desk, chair,...',
      'price': "",
      'newPrice': "1,650.000 VND / month",
      'service': [
        {'OFFER FOR STUDENTS': '200,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'item': [
        {'Size': 'Less than 32kg'},
        {'Side length': 'Less than 130cm'},
        {'Carrying': '1 person carrying'}
      ],
      'quantity': 0
    },
    {
      'id': 'BM5',
      'imagePath': 'assets/images/area4m2.png',
      'name': 'Area 4m' + String.fromCharCode(0x00B2),
      'decription':
          '1 2-3 bedroom house, bed + mattress, washing machine, dining set, chair, refrigerator, sofa...',
      'price': "",
      'newPrice': "1,955.000 VND / month",
      'service': [
        {'OFFER FOR STUDENTS': '250,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'item': [
        {'Size': 'Less than 40kg'},
        {'Side length': 'Less than 160cm'},
        {'Carrying': '2 person carrying'}
      ],
      'quantity': 0
    },
    {
      'id': 'BM6',
      'imagePath': 'assets/images/area5m2.png',
      'name': 'Area 5m' + String.fromCharCode(0x00B2),
      'decription':
          '1 2-3 bedroom house, bed + mattress, washing machine, dining set, chair, refrigerator, sofa...',
      'price': "",
      'newPrice': "2.215.000 VND / month",
      'service': [
        {'OFFER FOR STUDENTS': '300,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'item': [
        {'Size': 'Less than 40kg'},
        {'Side length': 'Less than 160cm'},
        {'Carrying': '2 person carrying'}
      ],
      'quantity': 0
    },
  ];
  List<Map<String, dynamic>> mockUpStorageData = [
    {
      'imagePath': 'assets/images/storage1.png',
      'name': 'Lakeview self storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'type_storage': "Cold storage",
      'rating': 4,
      'size': '50m x 30m x 10m',
      'distance': '2',
      'price': "35,000,000 VND"
    },
    {
      'imagePath': 'assets/images/storage2.png',
      'name': 'USA self Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'type_storage': "Archives storage",
      'rating': 4,
      'size': '50m x 30m x 10m',
      'distance': 4,
      'price': "Contact for price"
    },
    {
      'imagePath': 'assets/images/storage3.png',
      'name': 'Chalmetter super Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'type_storage': "Production warehouse",
      'rating': 4,
      'size': '50m x 30m x 10m',
      'distance': 11,
      'price': "30,000,000 VND"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (_, index) {
          return MuchServiceItem(
            listServices: mockUpKeepRentalsFewData[index],
          );
        },
        itemCount: mockUpKeepRentalsFewData.length,
      ),
    );
  }
}
