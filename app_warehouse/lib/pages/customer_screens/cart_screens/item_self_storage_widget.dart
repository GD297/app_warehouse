import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemSelfStorageWidget extends StatelessWidget {
  Map<String, dynamic> item;
  ItemSelfStorageWidget(this.item);
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

  final oCcy = new NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    // List<Box> listItem = [];
    // List<Box> fewItemServices =
    //     listFewServives.findAllByName(comboItem.listItem);
    // List<Box> muchItemServices =
    //     listMuchServives.findAllByName(comboItem.listItem);

    // List<Accessory> listAc =
    //     listAccessories.findAllByName(comboItem.listAccessories);
    // fewItemServices.forEach((element) {
    //   listItem.add(element);
    // });
    // muchItemServices.forEach((element) {
    //   listItem.add(element);
    // });
    // String item = "";
    // for (int i = 0; i < listItem.length; i++)
    //   item += comboItem.listItem[i].keys.first +
    //       " " +
    //       comboItem.listItem[i].values.first +
    //       ", ";
    // for (int i = 0; i < listAc.length; i++)
    //   item += comboItem.listAccessories[i].keys.first +
    //       " " +
    //       comboItem.listAccessories[i].values.first +
    //       ", ";
    // ;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Image.asset(
                  item['imagePath'],
                  height: 90,
                  width: 90,
                )),
                CustomSizedBox(
                  context: context,
                  width: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: item['name'],
                      color: CustomColor.black,
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 5,
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: item['price'] + ' VND',
                            color: CustomColor.black,
                            context: context,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          CustomText(
                            text: "Qty: 1",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
