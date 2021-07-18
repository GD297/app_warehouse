import 'package:app_warehouse/common/custom_tabbar_cus_home.dart';
import 'package:flutter/material.dart';

enum Service { FOR_RENT, PROTECTING_SERVICE }

class CustomerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    List<Map<String, dynamic>> mockUpData = [
      {
        'imagePath': 'assets/images/storage1.png',
        'name': 'Lakeview self storage',
        'address':
            '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
        'rating': 4,
        'distance': '2',
        'listBoxPrice': [
          {'0,5m x 1m x 1m': '260,000 VND'},
          {'1m x 1m x 1m': '450,000 VND'},
        ],
        'shippingPrice': [
          {'10km': '35,000 VND'},
          {'15km': '55,000 VND'},
          {'20km': '75,000 VND'},
          {'25km': '100,000 VND'},
        ],
        'pricePerFloor': [
          {'0,5m x 1m x 1m': '5,000 VND'},
          {'1m x 1m x 1m': '10,000 VND'},
        ],
      },
      {
        'imagePath': 'assets/images/storage2.png',
        'name': 'USA self Storage',
        'address':
            '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
        'rating': 4,
        'distance': 4,
        'listBoxPrice': [
          {'0,5m x 1m x 1m': '220,000 VND'},
          {'1m x 1m x 1m': '420,000 VND'},
        ],
        'pricePerFloor': [
          {'0,5m x 1m x 1m': '5,000 VND'},
          {'1m x 1m x 1m': '10,000 VND'},
        ],
        'shippingPrice': [
          {'10km': '35,000 VND'},
          {'15km': '55,000 VND'},
          {'20km': '75,000 VND'},
          {'25km': '100,000 VND'},
        ],
      },
      {
        'imagePath': 'assets/images/storage3.png',
        'name': 'Chalmetter super Storage',
        'address':
            '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
        'rating': 4,
        'distance': 11,
        'listBoxPrice': [
          {'0,5m x 1m x 1m': '210,000 VND'},
          {'1m x 1m x 1m': '410,000 VND'},
        ],
        'shippingPrice': [
          {'10km': '35,000 VND'},
          {'15km': '55,000 VND'},
          {'20km': '75,000 VND'},
          {'25km': '100,000 VND'},
        ],
        'pricePerFloor': [
          {'0,5m x 1m x 1m': '5,000 VND'},
          {'1m x 1m x 1m': '10,000 VND'},
        ]
      },
    ];

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomAppBarWithTab(),
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 24),
    //   child: ListView(
    //     children: [
    //       CustomAppBar(
    //         isHome: true,
    //       ),
    //       CustomSizedBox(
    //         context: context,
    //         height: 24,
    //       ),
    //       Row(
    //         children: [
    //           Container(
    //             width: deviceSize.width - 48,
    //             height: 40,
    //             child: TextFormField(
    //               decoration: InputDecoration(
    //                   prefixIcon: ImageIcon(
    //                     AssetImage('assets/images/search.png'),
    //                     color: CustomColor.black,
    //                   ),
    //                   suffixIcon: ImageIcon(
    //                     AssetImage('assets/images/filter.png'),
    //                     color: CustomColor.black,
    //                   ),
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(8),
    //                       borderSide: BorderSide(color: CustomColor.black[2]))),
    //             ),
    //           )
    //         ],
    //       ),
    //       CustomSizedBox(
    //         context: context,
    //         height: 24,
    //       ),
    //       ListView.builder(
    //         shrinkWrap: true,
    //         physics: ScrollPhysics(),
    //         itemBuilder: (_, index) {
    //           return StorageProtectingWidget(
    //               data: mockUpData[index], deviceSize: deviceSize);
    //         },
    //         itemCount: mockUpData.length,
    //       ),
    //       CustomSizedBox(
    //         context: context,
    //         height: 72,
    //       )
    //     ],
    //   ),
    // );
  }
}
