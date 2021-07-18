import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/pages/owner_screens/home_screen/owner_storage.dart';
import 'package:flutter/material.dart';

enum StatusCheckingStorage { Pending, Approved, Reject }

class OwnerHomeScreen extends StatelessWidget {
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
  List<Map<String, dynamic>> mockUpData = [
    {
      'imagePath': 'assets/images/storage1.png',
      'name': 'Lakeview self storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
      'size': '50m x 30m x 10m',
      'price': '35,000,000 VND',
      'statusChecking': StatusCheckingStorage.Approved
    },
    {
      'imagePath': 'assets/images/storage2.png',
      'name': 'USA self Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
      'size': '50m x 30m x 10m',
      'price': '35,000,000 VND',
      'statusChecking': StatusCheckingStorage.Pending
    },
    {
      'imagePath': 'assets/images/storage3.png',
      'name': 'Chalmetter super Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
      'size': '50m x 30m x 10m',
      'price': '35,000,000 VND',
      'statusChecking': StatusCheckingStorage.Reject
    },
    {
      'imagePath': 'assets/images/storage4.png',
      'name': 'Moutain super Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
      'size': '50m x 30m x 10m',
      'price': '35,000,000 VND',
      'statusChecking': StatusCheckingStorage.Pending
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      color: Color(0XFFF0F0F0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            CustomAppBar(
              isHome: true,
              isOwner: true,
            ),
            CustomSizedBox(
              context: context,
              height: 24,
            ),
            Container(
              width: deviceSize.width - 52,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: ImageIcon(
                    AssetImage('assets/images/search.png'),
                    color: CustomColor.black,
                  ),
                  suffixIcon: ImageIcon(
                    AssetImage('assets/images/filter.png'),
                    color: CustomColor.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: CustomColor.black[2],
                    ),
                  ),
                ),
              ),
            ),
            CustomSizedBox(
              context: context,
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (_, index) {
                return OwnerStorage(
                    data: mockUpData[index], deviceSize: deviceSize);
              },
              itemCount: mockUpData.length,
            ),
            CustomSizedBox(
              context: context,
              height: 72,
            ),
          ],
        ),
      ),
    );
  }
}
