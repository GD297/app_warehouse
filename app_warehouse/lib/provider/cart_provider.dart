import 'package:app_warehouse/provider/accessory.dart';
import 'package:app_warehouse/provider/item_cart.dart';
import 'package:app_warehouse/provider/keep_reantal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Map<String, ItemInCart> _items = {};
  Map<Box, int> mockUpKeepRentalsFewData = {
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
    ): 0,
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
    ): 0,
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
    ): 0,
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
    ): 0,
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
    ): 0
  };
  Map<Accessory, int> listAccessoryForFew = {
    Accessory(
      id: 'AC1',
      name: "Tape",
      price: 22000,
      imagePath: "assets/images/icon_bangkeo.png",
      size: "100yard x 4cm",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/bang-keo.png",
    ): 0,
    Accessory(
      id: 'AC2',
      name: "Premium Locks",
      price: 165000,
      size: "50mm x 75mm",
      imagePath: "assets/images/icon_okhoa.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/locks.png",
    ): 0,
    Accessory(
      id: 'AC3',
      name: "Carton Box",
      price: 25000,
      size: "58cm x 38cm x 34cm",
      imagePath: "assets/images/thungcarton.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/carton-box.png",
    ): 0,
    Accessory(
      id: 'AC4',
      name: "Air foam, styrofoam",
      price: 20000,
      size: "50cm x 5m x 3mm",
      imagePath: "assets/images/icon_mangpe.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/styrofoam.png",
    ): 0,
    Accessory(
      id: 'AC5',
      name: "Paper Thick",
      price: 16500,
      size: "35cm x 35cm",
      imagePath: "assets/images/giaychen.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/paper-thick.png",
    ): 0,
    Accessory(
      id: 'AC6',
      name: "Air bubble foam",
      price: 25000,
      size: "70cm x 5m",
      imagePath: "assets/images/bong-bong-khi.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/air-bubble.png",
    ): 0,
  };
  Map<Box, int> mockUpKeepRentalsMuchData = {
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
    ): 0,
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
      ],
    ): 0,
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
    ): 0,
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
    ): 0,
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
    ): 0,
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
    ): 0,
  };
  Map<Accessory, int> listAccessoryForMuch = {
    Accessory(
      id: 'AC1',
      name: "Tape",
      price: 22000,
      imagePath: "assets/images/icon_bangkeo.png",
      size: "100yard x 4cm",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/bang-keo.png",
    ): 0,
    Accessory(
      id: 'AC2',
      name: "Premium Locks",
      price: 165000,
      size: "50mm x 75mm",
      imagePath: "assets/images/icon_okhoa.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/locks.png",
    ): 0,
    Accessory(
      id: 'AC3',
      name: "Carton Box",
      price: 25000,
      size: "58cm x 38cm x 34cm",
      imagePath: "assets/images/thungcarton.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/carton-box.png",
    ): 0,
    Accessory(
      id: 'AC4',
      name: "Air foam, styrofoam",
      price: 20000,
      size: "50cm x 5m x 3mm",
      imagePath: "assets/images/icon_mangpe.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/styrofoam.png",
    ): 0,
    Accessory(
      id: 'AC5',
      name: "Paper Thick",
      price: 16500,
      size: "35cm x 35cm",
      imagePath: "assets/images/giaychen.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/paper-thick.png",
    ): 0,
    Accessory(
      id: 'AC6',
      name: "Air bubble foam",
      price: 25000,
      size: "70cm x 5m",
      imagePath: "assets/images/bong-bong-khi.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/air-bubble.png",
    ): 0,
  };

  Map<String, ItemInCart> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void changeSelectedItem(dynamic product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => ItemInCart(
              id: existingItem.id,
              typeItem: existingItem.typeItem,
              productItem: existingItem.productItem,
              quantity: existingItem.quantity,
              isCheck: !existingItem.isCheck));
    }
    notifyListeners();
  }

  void clearQuantityServices(String services) {
    if (services == 'FewServices') {
      mockUpKeepRentalsFewData.forEach((key, value) {
        mockUpKeepRentalsFewData[key] = 0;
      });
      listAccessoryForFew.forEach((key, value) {
        listAccessoryForFew[key] = 0;
      });
    } else if (services == 'MuchServices') {
      mockUpKeepRentalsMuchData.forEach((key, value) {
        mockUpKeepRentalsMuchData[key] = 0;
      });
      listAccessoryForMuch.forEach((key, value) {
        listAccessoryForMuch[key] = 0;
      });
    }
  }

  double getTotalCart() {
    double totalPrice = 0;
    _items.forEach((key, value) {
      if (value.isCheck) {
        totalPrice += value.productItem.price * value.quantity;
      }
    });

    return totalPrice;
  }

  void increaseServicesItem(String typeService, String id) {
    switch (typeService) {
      case 'mockUpKeepRentalsFewData':
        mockUpKeepRentalsFewData.forEach((key, value) {
          if (key.id == id) {
            mockUpKeepRentalsFewData[key] += 1;
            print(mockUpKeepRentalsFewData[key]);
          }
        });
        break;
      case 'listAccessoryForFew':
        listAccessoryForFew.forEach((key, value) {
          if (key.name == id) {
            listAccessoryForFew[key] += 1;
            print(listAccessoryForFew[key]);
          }
        });
        break;
      case 'listAccessoryForMuch':
        listAccessoryForMuch.forEach((key, value) {
          if (key.name == id) {
            listAccessoryForMuch[key] += 1;
            print(listAccessoryForMuch[key]);
          }
        });
        break;
      case 'mockUpKeepRentalsMuchData':
        mockUpKeepRentalsMuchData.forEach((key, value) {
          if (key.id == id) {
            mockUpKeepRentalsMuchData[key] += 1;
          }
        });
        break;
    }
  }

  void decreaseServicesItem(String typeService, String id) {
    switch (typeService) {
      case 'mockUpKeepRentalsFewData':
        mockUpKeepRentalsFewData.forEach((key, value) {
          if (key.id == id) {
            if (mockUpKeepRentalsFewData[key] > 0) {
              mockUpKeepRentalsFewData[key] -= 1;
              print(mockUpKeepRentalsFewData[key]);
            }
          }
        });
        break;
      case 'listAccessoryForFew':
        listAccessoryForFew.forEach((key, value) {
          if (key.name == id) {
            if (listAccessoryForFew[key] > 0) {
              listAccessoryForFew[key] -= 1;
              print(listAccessoryForFew[key]);
            }
          }
        });
        break;
      case 'listAccessoryForMuch':
        listAccessoryForMuch.forEach((key, value) {
          if (key.name == id) {
            if (listAccessoryForMuch[key] > 0) {
              listAccessoryForMuch[key] -= 1;
              print(listAccessoryForMuch[key]);
            }
          }
        });
        break;
      case 'mockUpKeepRentalsMuchData':
        mockUpKeepRentalsMuchData.forEach((key, value) {
          if (key.id == id) {
            if (mockUpKeepRentalsMuchData[key] > 0) {
              mockUpKeepRentalsMuchData[key] -= 1;
              print(mockUpKeepRentalsMuchData[key]);
            }
          }
        });
        break;
    }
  }

  void increaseQuantity(dynamic product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => ItemInCart(
              id: existingItem.id,
              typeItem: existingItem.typeItem,
              productItem: existingItem.productItem,
              quantity: existingItem.quantity + 1,
              isCheck: existingItem.isCheck));
    }
    notifyListeners();
  }

  void decreaseQuantity(dynamic product, int quantity) {
    if (_items.containsKey(product.id)) {
      if (quantity > 1) {
        _items.update(
            product.id,
            (existingItem) => ItemInCart(
                id: existingItem.id,
                typeItem: existingItem.typeItem,
                productItem: existingItem.productItem,
                quantity: existingItem.quantity - 1,
                isCheck: existingItem.isCheck));
      } else {
        _items.remove(product.id);
      }
    }
    notifyListeners();
  }

  int countByTypeSelected(String type) {
    int count = 0;
    _items.forEach((key, value) {
      if (value.typeItem == type) {
        if (value.isCheck) {
          count += 1;
        }
      }
    });

    return count;
  }

  Map<String, ItemInCart> findByType(String type) {
    Map<String, ItemInCart> listItem = {};
    _items.forEach((key, value) {
      if (_items[key].typeItem == type) {
        listItem.putIfAbsent(
          _items[key].id,
          () => ItemInCart(
              id: _items[key].id,
              productItem: _items[key].productItem,
              typeItem: _items[key].typeItem,
              quantity: _items[key].quantity,
              isCheck: _items[key].isCheck),
        );
      }
    });
    return listItem;
  }

  Map<String, ItemInCart> getSelectedItem() {
    Map<String, ItemInCart> listItem = {};

    _items.forEach((key, valuae) {
      if (_items[key].isCheck) {
        listItem.putIfAbsent(
          _items[key].productItem.id,
          () => ItemInCart(
              id: _items[key].id,
              productItem: _items[key].productItem,
              typeItem: _items[key].typeItem,
              quantity: _items[key].quantity,
              isCheck: _items[key].isCheck),
        );
      }
    });

    return listItem;
  }

  Map<String, ItemInCart> getSelectedItemByType(String type) {
    Map<String, ItemInCart> listItem = {};

    _items.forEach((key, valuae) {
      if (_items[key].isCheck && _items[key].typeItem == type) {
        listItem.putIfAbsent(
          _items[key].productItem.id,
          () => ItemInCart(
              id: _items[key].id,
              productItem: _items[key].productItem,
              typeItem: _items[key].typeItem,
              quantity: _items[key].quantity,
              isCheck: _items[key].isCheck),
        );
      }
    });
    print('Imte Cart' + listItem.length.toString());
    return listItem;
  }

  void changeAllSelected(bool isCheck) {
    _items.forEach((key, value) {
      value.isCheck = isCheck;
    });

    notifyListeners();
  }

  void addItemForComboMockUp(dynamic product, String type) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => ItemInCart(
              id: existingItem.id,
              typeItem: existingItem.typeItem,
              productItem: existingItem.productItem,
              quantity: existingItem.quantity + 1,
              isCheck: true));
    } else {
      _items.putIfAbsent(
        product.id,
        () => ItemInCart(
            id: DateTime.now().toString(),
            productItem: product,
            typeItem: type,
            quantity: 1,
            isCheck: true),
      );
    }
  }

  void addItemForCombo(dynamic product, String type) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => ItemInCart(
              id: existingItem.id,
              typeItem: existingItem.typeItem,
              productItem: existingItem.productItem,
              quantity: existingItem.quantity + 1,
              isCheck: existingItem.isCheck));
    } else {
      _items.putIfAbsent(
        product.id,
        () => ItemInCart(
            id: DateTime.now().toString(),
            productItem: product,
            typeItem: type,
            quantity: 1,
            isCheck: false),
      );
    }

    notifyListeners();
  }

  void addItem(dynamic product, String type, int quantity) {
    _items.putIfAbsent(
      product.id,
      () => ItemInCart(
          id: DateTime.now().toString(),
          productItem: product,
          typeItem: type,
          quantity: quantity,
          isCheck: false),
    );

    notifyListeners();
  }

  void addItemForServices(String typeServices) {
    switch (typeServices) {
      case 'ForFewServices':
        mockUpKeepRentalsFewData.forEach((key1, value) {
          if (value > 0) {
            addItem(key1, 'FewServices', value);
            listAccessoryForFew.forEach((key2, value) {
              if (value > 0) {
                addItem(key2, 'AccFewServices', value);
              }
            });
          }
        });
        break;
      case 'ForMuchServices':
        mockUpKeepRentalsMuchData.forEach((key1, value) {
          if (value > 0) {
            addItem(key1, 'MuchServices', value);
            listAccessoryForMuch.forEach((key2, value) {
              if (value > 0) {
                addItem(key2, 'AccMuchServices', value);
              }
            });
          }
        });
        break;
    }
  }

  void removeItem(Map<String, ItemInCart> productId) {
    productId.forEach((key, value) {
      if (_items.containsKey(key)) {
        _items.remove(key);
      }
    });
    notifyListeners();
  }

  void removeItemForMockup(Map<String, ItemInCart> productId) {
    productId.forEach((key, value) {
      if (_items.containsKey(key)) {
        _items.remove(key);
      }
    });
  }
}
