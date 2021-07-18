import 'package:app_warehouse/provider/combo_item.dart';
import 'package:flutter/cupertino.dart';

class ComboItemProdiver with ChangeNotifier {
  List<Combo> mockUpComboData = [
    Combo(
      id: "CB1",
      imagePath: 'assets/images/storage1.png',
      name: 'Combo Keep Rental 3 months',
      decription: 'Allowable weight upto 25kg and some accessories',
      price: 342000,
      sale: 0.1,
      listItem: [
        {'x1': 'Bolo Box'},
      ],
      listAccessories: [
        {'x1': 'Tape'},
        {'x1': 'Air foam, styrofoam'}
      ],
    ),
    Combo(
      id: "CB2",
      imagePath: 'assets/images/storage1.png',
      name: 'Combo Self Storage 3 months',
      decription: 'Size storage 2m x 2m x 2,5m',
      price: 3260000,
      sale: 0.1,
      listItem: [
        {'x1 ': 'Area 4m' + String.fromCharCode(0x00B2)},
      ],
      listAccessories: [
        {'x1': 'Tape'},
        {'x1': 'Premium Locks'},
        {'x2': 'Carton Box'},
      ],
    ),
    Combo(
      id: "CB3",
      imagePath: 'assets/images/storage1.png',
      name: 'Combo-Box 1',
      decription: 'Allowable weight upto 25kg and some accessories',
      price: 510000,
      sale: 0.1,
      listItem: [
        {'x1': 'Bolo Box'},
      ],
      listAccessories: [
        {'x1': 'Tape'},
        {'x1': 'Air foam, styrofoam'},
        {'x1': 'Premium Locks'},
      ],
    ),
    Combo(
      id: "CB4",
      imagePath: 'assets/images/storage1.png',
      name: 'Combo-Box 1',
      decription: 'Allowable weight upto 25kg and some accessories',
      price: 510000,
      sale: 0.1,
      listItem: [
        {'x1': 'Bolo Box'},
      ],
      listAccessories: [
        {'x1': 'Tape'},
        {'x1': 'Premium Locks'},
      ],
    )
  ];

  Combo findByID(String id) {
    return mockUpComboData.firstWhere((element) => id == element.id);
  }
}
