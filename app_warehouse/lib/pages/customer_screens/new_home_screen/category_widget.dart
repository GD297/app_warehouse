import 'package:app_warehouse/common/custom_button_category.dart';
import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/keep_rentals_screen.dart';
import 'package:app_warehouse/pages/customer_screens/self_storage_screen/self_storage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';

void main() => runApp(CategoryWidget());
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

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: MediaQuery.of(context).size.height / 8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ButtonCategory(
            imgPath: "assets/images/box.png",
            textButton: Text("Keep Rentals"),
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => KeepRentalScreen(
                          data: mockUpStorageData[0],
                        )),
              );
            },
          ),
          ButtonCategory(
            imgPath: "assets/images/storage-box.png",
            textButton: Text("Storage"),
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SelfStorageScreen(
                          data: mockUpStorageData[0],
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
