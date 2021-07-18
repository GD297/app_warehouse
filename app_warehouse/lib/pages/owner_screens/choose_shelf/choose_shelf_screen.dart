import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/status_shelf.dart';
import 'package:flutter/material.dart';

class ChooseSelfScreen extends StatelessWidget {
  List<Map<String, dynamic>> mockUpData = [
    {
      'imagePath': 'assets/images/storage1.png',
      'name': 'Medium Storage',
      'address':
          '12, Phan Văn Trị, Phường 6, Quận Gò Vấp, Thành Phố Hồ Chí Minh',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage2.png',
      'name': 'Prenimum Storage',
      'address':
          '12, Phan Văn Trị, Phường 6, Quận Gò Vấp, Thành Phố Hồ Chí Minh',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage3.png',
      'name': 'Small Storage',
      'address':
          '12, Phan Văn Trị, Phường 6, Quận Gò Vấp, Thành Phố Hồ Chí Minh',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage4.png',
      'name': 'Large Storage',
      'address':
          '12, Phan Văn Trị, Phường 6, Quận Gò Vấp, Thành Phố Hồ Chí Minh',
      'rating': 4,
    },
  ];

  List<Map<String, dynamic>> dataShelves = [
    {
      'name': 'Shelf - 1',
      'percent': 80,
      'listBox': [
        {
          'orderId': 'R001',
          'type': 'large',
          'position': 'B1',
          'timeRemain': '1 Month - 1 Week - 4 Days'
        },
        {
          'orderId': 'R001',
          'type': 'small',
          'position': 'A4',
          'timeRemain': '1 Month - 1 Week - 4 Days'
        },
        {
          'orderId': 'R002',
          'type': 'large',
          'position': 'A1',
          'timeRemain': '1 Week - 4 Days'
        },
        {
          'orderId': 'R002',
          'type': 'small',
          'position': 'A3',
          'timeRemain': '1 Week - 4 Days'
        }
      ]
    },
    {
      'name': 'Shelf - 2',
      'percent': 40,
    },
    {
      'name': 'Shelf - 3',
      'percent': 100,
    },
    {
      'name': 'Shelf - 4',
      'percent': 0,
    },
  ];

  int _selectedIndex = 0;

  Widget _buildStorage(
      {Size deviceSize,
      Map<String, dynamic> data,
      BuildContext context,
      int currentIndex}) {
    Color textColor = currentIndex == _selectedIndex
        ? CustomColor.purple
        : CustomColor.black[3];

    return Container(
      height: deviceSize.height / 4,
      width: deviceSize.width / 3,
      margin: const EdgeInsets.only(right: 24),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                          width: deviceSize.width / 3,
                          height: deviceSize.height / 12,
                          child: Image.asset(
                            data['imagePath'],
                            fit: BoxFit.cover,
                          )),
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 8,
                    ),
                    CustomText(
                        text: data['name'],
                        color: textColor,
                        context: context,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)
                  ])),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          CustomSizedBox(
            context: context,
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomAppBar(
              isHome: false,
              isOwner: true,
            ),
          ),
          CustomSizedBox(
            context: context,
            height: 16,
          ),
          Container(
            height: deviceSize.height / 7,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              SizedBox(
                width: 24,
              ),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) => _buildStorage(
                    context: context,
                    data: mockUpData[index],
                    currentIndex: index,
                    deviceSize: deviceSize),
                itemCount: mockUpData.length,
              ),
            ]),
          ),
          CustomSizedBox(
            context: context,
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return StatusShelf(
                  deviceSize: deviceSize,
                  data: dataShelves[index],
                );
              },
              itemCount: dataShelves.length,
            ),
          ),
        ],
      ),
    );
  }
}
