import 'package:app_warehouse/provider/keep_reantal.dart';
import 'package:flutter/cupertino.dart';

class BoxFew with ChangeNotifier {
  List<Box> mockUpKeepRentalsFewData = [
    Box(
      id: "BF1",
      imagePath: 'assets/images/thungbolo.png',
      name: 'Bolo Box',
      descreption: 'Can hold 25 pairs of shoes/clothes/80 books/...',
      price: 100000,
      services: [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': '60cm x 40cm x 36cm'},
        {'Volume': '80L'},
      ],
    ),
    Box(
      id: "BF2",
      imagePath: 'assets/images/sizes.png',
      name: 'Size S',
      descreption:
          'Small document box / Handbag / Computer briefcase / Guitar...',
      price: 70000,
      services: [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': 'Less than 10kg'},
        {'Side length': 'Less than 40cm'},
        {'Carrying': '1 person carrying'}
      ],
    ),
    Box(
      id: "BF3",
      imagePath: 'assets/images/sizem.png',
      name: 'Size M',
      descreption:
          'Suitcase size M < 70L/ Microwave/ Clothes box < 25kg/ Standing fan/ Baby stroller..',
      price: 100000,
      services: [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': 'Less than 25kg'},
        {'Side length': 'Less than 100cm'},
        {'Carrying': '1 person carrying'}
      ],
    ),
    Box(
      id: "BF4",
      imagePath: 'assets/images/sizel.png',
      name: 'Size L',
      descreption:
          'Suitcase size L/ Air conditioner/ Bicycle/ Refrigerator 90L/ Folding mattress 1.6/ Single sofa...',
      price: 150000,
      services: [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': 'Less than 32kg'},
        {'Side length': 'Less than 130cm'},
        {'Carrying': '1 person carrying'}
      ],
    ),
    Box(
      id: "BF5",
      imagePath: 'assets/images/sizexl.png',
      name: 'Size XL',
      descreption:
          'Refrigerator < 250 L/ Bed frame/ TV < 50 Inch/ 1.6m folding mattress...',
      price: 200000,
      services: [
        {'FREE': ' Bolo plastic crate + sealing seal'},
        {'SERVICES': 'packing service for only 30,000/carton'}
      ],
      listSize: [
        {'Size': 'Less than 40kg'},
        {'Side length': 'Less than 160cm'},
        {'Carrying': '2 person carrying'}
      ],
    ),
  ];
  Box findByID(String id) {
    return mockUpKeepRentalsFewData.firstWhere((element) => id == element.id);
  }

  Box findByName(String name) {
    Box searchBox;
    try {
      searchBox = mockUpKeepRentalsFewData
          .firstWhere((element) => name == element.name);
      return searchBox;
    } catch (e) {
      return null;
    }
  }

  List<Box> findAllByName(List<Map<String, dynamic>> listItem) {
    List<Box> searchBox = [];
    Box services;
    for (int i = 0; i < listItem.length; i++) {
      for (int j = 0; j < mockUpKeepRentalsFewData.length; j++) {
        if (listItem[i].values.first == mockUpKeepRentalsFewData[j].name) {
          services = mockUpKeepRentalsFewData[j];
          searchBox.add(services);
        }
      }
    }
    // print("List Few Item: "+searchBox.length.toString());
    return searchBox;
  }

  
}
