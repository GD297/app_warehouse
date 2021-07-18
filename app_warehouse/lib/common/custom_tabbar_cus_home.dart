import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_tabbutton.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/cart_screen.dart';
import 'package:app_warehouse/pages/customer_screens/home/storage_protected_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBarWithTab(title: 'Flutter Demo Home Page');
  }
}

class CustomAppBarWithTab extends StatefulWidget {
  CustomAppBarWithTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CustomAppBarWithTab>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> mockUpBoxData = [
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
      ]
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
  var _scrollController, _tabController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: CustomAppBar(
                isHome: true,
              ),
              pinned: false,
              floating: false,
              snap: false,
              backgroundColor: CustomColor.white,
            ),
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              backgroundColor: CustomColor.white,
              bottom: TabBar(
                indicatorColor: CustomColor.purple,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(color: CustomColor.purple),
                tabs: <TabButton>[
                  TabButton(
                    text: "Box",
                    iconPath: 'assets/images/box.png',
                    pageNumber: 0,
                  ),
                  TabButton(
                    text: "Self-Storage",
                    iconPath: 'assets/images/storage-box.png',
                    pageNumber: 1,
                  )
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: Container(
          color: Color(0XFFF0F0F0),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: ScrollPhysics(),
              //   itemBuilder: (_, index) {
              //     if (index < mockUpBoxData.length - 1) {
              //       return BoxProtectingWidget(
              //           data: mockUpBoxData[index], deviceSize: deviceSize);
              //     } else if (index == mockUpBoxData.length - 1) {
              //       return Column(
              //         children: [
              //           BoxProtectingWidget(
              //               data: mockUpBoxData[index], deviceSize: deviceSize),
              //           CustomSizedBox(
              //             context: context,
              //             height: 72,
              //           )
              //         ],
              //       );
              //     }
              //   },
              //   itemCount: mockUpBoxData.length,
              // ),
              CartScreen(),
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (_, index) {
                  if (index < mockUpBoxData.length - 1) {
                    return StorageProtectingWidget(
                        data: mockUpStorageData[index], deviceSize: deviceSize);
                  } else if (index == mockUpBoxData.length - 1) {
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
                itemCount: mockUpBoxData.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
