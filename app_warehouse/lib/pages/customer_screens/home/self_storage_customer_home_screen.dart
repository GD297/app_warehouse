import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/pages/customer_screens/home/storage_protected_widget.dart';
import 'package:flutter/material.dart';

class SelfStorageCustomerHomeScreen extends StatelessWidget {
  List<Map<String, dynamic>> mockUpStorageData = [
    {
      'imagePath': 'assets/images/storage1.png',
      'name': 'Storage 2m2',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
      'size': '1m x 2m x 2.5m',
      'distance': '2',
      'area': '2m2',
      'price': "600,000 VND"
    },
    {
      'imagePath': 'assets/images/storage2.png',
      'name': 'Storage 4m2',
      'address': '12, Cach Mang Thang 8, 10 District, Ward 5, Ho Chi Minh City',
      'rating': 4.5,
      'size': '2m x 2m x 2.5m',
      'distance': 4,
      'area': '4m2',
      'price': "1,000,000 VND"
    },
    {
      'imagePath': 'assets/images/storage3.png',
      'name': 'Storage 8m2',
      'address': '12, Gia Phu, 10 District, Ward 5, Ho Chi Minh City',
      'rating': 5,
      'size': '2m x 4m x 2.5m',
      'distance': 11,
      'area': '8m2',
      'price': "1,600,000 VND"
    },
    {
      'imagePath': 'assets/images/storage4.png',
      'name': 'Storage 16m2',
      'address': '12, Kim Bien, 10 District, Ward 5, Ho Chi Minh City',
      'rating': 4,
      'size': '4m x 4m x 2.5m',
      'distance': 12,
      'area': '16m2',
      'price': "2,800,000 VND"
    },
  ];

  _showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text(""),
              content: new Text(""),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: deviceSize.height / 10),
        child: new FloatingActionButton(
            elevation: 0.0,
            child: Container(
                height: 24,
                width: 24,
                child: new Image.asset(
                  'assets/images/box.png',
                  fit: BoxFit.cover,
                )),
            backgroundColor: CustomColor.lightBlue,
            onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomAppBar(
              isHome: true,
              isOwner: false,
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                if (index < mockUpStorageData.length - 1) {
                  return StorageProtectingWidget(
                      data: mockUpStorageData[index], deviceSize: deviceSize);
                } else if (index == mockUpStorageData.length - 1) {
                  return Column(
                    children: [
                      StorageProtectingWidget(
                          data: mockUpStorageData[index],
                          deviceSize: deviceSize),
                      CustomSizedBox(
                        context: context,
                        height: 72,
                      )
                    ],
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
