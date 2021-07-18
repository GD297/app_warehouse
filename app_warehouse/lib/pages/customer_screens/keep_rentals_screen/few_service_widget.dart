import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/few_service_itens.dart';
import 'package:flutter/material.dart';

class FewServiceWidget extends StatelessWidget {
  static const List<Map<String, dynamic>> mockUpKeepRentalsFewData = [
    {
      'id': 'BF1',
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
      ],
      'quantity': 0
    },
    {
      'id': 'BF2',
      'imagePath': 'assets/images/sizes.png',
      'name': 'Size S',
      'decription':
          'Small document box / Handbag / Computer briefcase / Guitar...',
      'price': "",
      'newPrice': "70.000 VND / month",
      'service': [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      'item': [
        {'Size': 'Less than 10kg'},
        {'Side length': 'Less than 40cm'},
        {'Carrying': '1 person carrying'}
      ],
      'quantity': 0
    },
    {
      'id': 'BF3',
      'imagePath': 'assets/images/sizem.png',
      'name': 'Size M',
      'decription':
          'Suitcase size M < 70L/ Microwave/ Clothes box < 25kg/ Standing fan/ Baby stroller..',
      'price': "",
      'newPrice': "100.000 VND / month",
      'service': [
        {'FREE': ' Bolo plastic crate + sealing seal'},
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
      'id': 'BF4',
      'imagePath': 'assets/images/sizel.png',
      'name': 'Size L',
      'decription':
          'Suitcase size L/ Air conditioner/ Bicycle/ Refrigerator 90L/ Folding mattress 1.6/ Single sofa...',
      'price': "",
      'newPrice': "150.000 VND / month",
      'service': [
        {'FREE': ' Bolo plastic crate + sealing seal'},
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
      'id': 'BF5',
      'imagePath': 'assets/images/sizexl.png',
      'name': 'Size XL',
      'decription':
          'Refrigerator < 250 L/ Bed frame/ TV < 50 Inch/ 1.6m folding mattress...',
      'price': "",
      'newPrice': "200.000 VND / month",
      'service': [
        {'FREE': ' Bolo plastic crate + sealing seal'},
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
          return FewServiceItem(
            listServices: mockUpKeepRentalsFewData[index],
            isCard: false,
          );
        },
        itemCount: mockUpKeepRentalsFewData.length,
      ),
    );
  }
}
