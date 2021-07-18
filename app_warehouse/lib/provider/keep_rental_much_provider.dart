import 'package:app_warehouse/provider/keep_reantal.dart';
import 'package:flutter/cupertino.dart';

class BoxMuch with ChangeNotifier {
  List<Box> mockUpKeepRentalsMuchData = [
    Box(
      id: 'BM1',
      imagePath: 'assets/images/area0.5m2.png',
      name: 'Area 0.5m' + String.fromCharCode(0x00B2),
      descreption: 'Can hold 5 boxes of clothes',
      price: 400000,
      services: [
        {'OFFER FOR STUDENTS': '50,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': '0.5m x 1m x 2m'},
        {'Volume': '5 boxes of clothes'},
      ],
    ),
    Box(
        id: 'BM2',
        imagePath: 'assets/images/area1m2.png',
        name: 'Area 1m' + String.fromCharCode(0x00B2),
        descreption:
            '1 boarding room: 5-6 clothes boxes, plastic cabinets, mirrors, folding tables...',
        price: 750000,
        services: [
          {'OFFER FOR STUDENTS': '100,000/month off storage fee.'},
          {'SERVICES': 'packing service for only 30,000/carton'}
        ],
        listSize: [
          {'Size': '1m x 1m x 2m'},
        ]),
    Box(
      id: 'BM3',
      imagePath: 'assets/images/area2m2.png',
      name: 'Area 2m' + String.fromCharCode(0x00B2),
      descreption:
          '1 bedroom apartment: wedge, 8-10 wardrobes, refrigerator, desk, chair,... ',
      price: 1275000,
      services: [
        {'OFFER FOR STUDENTS': '150,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': '1m x 2m x 2m'},
        {'Side length': 'Less than 100cm'},
        {'Carrying': '1 person carrying'}
      ],
    ),
    Box(
      id: 'BM4',
      imagePath: 'assets/images/area3m2.png',
      name: 'Area 3m' + String.fromCharCode(0x00B2),
      descreption:
          '2-bedroom apartment: bed, 8-10 boxes of clothes, refrigerator, washing machine, air conditioner, desk, chair,...',
      price: 1650000,
      services: [
        {'OFFER FOR STUDENTS': '200,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': '1m x 3m x 2m'},
        {'Side length': 'Less than 130cm'},
        {'Carrying': '1 person carrying'}
      ],
    ),
    Box(
      id: "BM5",
      imagePath: 'assets/images/area4m2.png',
      name: 'Area 4m' + String.fromCharCode(0x00B2),
      descreption:
          '1 2-3 bedroom house, bed + mattress, washing machine, dining set, chair, refrigerator, sofa...',
      price: 1955000,
      services: [
        {'OFFER FOR STUDENTS': '250,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': '2m x 2m x 2m'},
        {'Side length': 'Less than 160cm'},
        {'Carrying': '2 person carrying'}
      ],
    ),
    Box(
      id: "BM6",
      imagePath: 'assets/images/area5m2.png',
      name: 'Area 5m' + String.fromCharCode(0x00B2),
      descreption:
          '1 2-3 bedroom house, bed + mattress, washing machine, dining set, chair, refrigerator, sofa...',
      price: 2215000,
      services: [
        {'OFFER FOR STUDENTS': '300,000/month off storage fee.'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': '2.5m x 2m x 2m'},
        {'Side length': 'Less than 160cm'},
        {'Carrying': '2 person carrying'}
      ],
    )
  ];
  Box findByID(String id) {
    return mockUpKeepRentalsMuchData.firstWhere((element) => id == element.id);
  }

  Box findByName(String name) {
    return mockUpKeepRentalsMuchData
        .firstWhere((element) => name == element.name);
  }

  List<Box> findAllByName(List<Map<String, dynamic>> listItem) {
    List<Box> searchBox = [];
    Box services;
    for (int i = 0; i < listItem.length; i++) {
      for (int j = 0; j < mockUpKeepRentalsMuchData.length; j++) {
        if (listItem[i].values.first == mockUpKeepRentalsMuchData[j].name) {
          services = mockUpKeepRentalsMuchData[j];
          searchBox.add(services);
        }
      }
    }
    // print("List Much Item: " + searchBox.length.toString());
    return searchBox;
  }
}
