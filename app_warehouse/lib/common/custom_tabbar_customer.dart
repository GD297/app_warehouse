// import 'package:app_warehouse/common/custom_app_bar.dart';
// import 'package:app_warehouse/common/custom_color.dart';
// import 'package:app_warehouse/common/custom_sizebox.dart';
// import 'package:app_warehouse/common/custom_tabbutton.dart';
// import 'package:app_warehouse/pages/customer_screens/home/box_procteting_widget.dart';
// import 'package:flutter/material.dart';

// class CustomTab extends StatefulWidget {
//   @override
//   _CustomTabState createState() => _CustomTabState();
// }

// class _CustomTabState extends State<CustomTab> {
//   int _selectedPage = 0;
//   PageController _pageController;
//   List<Map<String, dynamic>> mockUpBoxData = [
//     {
//       'imagePath': 'assets/images/storage1.png',
//       'name': 'Lakeview self storage',
//       'address':
//           '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
//       'rating': 4,
//       'distance': '2',
//       'listBoxPrice': [
//         {'0,5m x 1m x 1m': '260,000 VND'},
//         {'1m x 1m x 1m': '450,000 VND'},
//       ],
//       'shippingPrice': [
//         {'10km': '35,000 VND'},
//         {'15km': '55,000 VND'},
//         {'20km': '75,000 VND'},
//         {'25km': '100,000 VND'},
//       ],
//       'pricePerFloor': [
//         {'0,5m x 1m x 1m': '5,000 VND'},
//         {'1m x 1m x 1m': '10,000 VND'},
//       ]
//     },
//     {
//       'imagePath': 'assets/images/storage2.png',
//       'name': 'USA self Storage',
//       'address':
//           '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
//       'rating': 4,
//       'distance': 4,
//       'listBoxPrice': [
//         {'0,5m x 1m x 1m': '220,000 VND'},
//         {'1m x 1m x 1m': '420,000 VND'},
//       ],
//       'pricePerFloor': [
//         {'0,5m x 1m x 1m': '5,000 VND'},
//         {'1m x 1m x 1m': '10,000 VND'},
//       ],
//       'shippingPrice': [
//         {'10km': '35,000 VND'},
//         {'15km': '55,000 VND'},
//         {'20km': '75,000 VND'},
//         {'25km': '100,000 VND'},
//       ],
//     },
//     {
//       'imagePath': 'assets/images/storage3.png',
//       'name': 'Chalmetter super Storage',
//       'address':
//           '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
//       'rating': 4,
//       'distance': 11,
//       'listBoxPrice': [
//         {'0,5m x 1m x 1m': '210,000 VND'},
//         {'1m x 1m x 1m': '410,000 VND'},
//       ],
//       'shippingPrice': [
//         {'10km': '35,000 VND'},
//         {'15km': '55,000 VND'},
//         {'20km': '75,000 VND'},
//         {'25km': '100,000 VND'},
//       ],
//       'pricePerFloor': [
//         {'0,5m x 1m x 1m': '5,000 VND'},
//         {'1m x 1m x 1m': '10,000 VND'},
//       ]
//     },
//   ];

//   void _changePage(int pageNum) {
//     setState(() {
//       _selectedPage = pageNum;
//       _pageController.animateToPage(pageNum,
//           duration: Duration(milliseconds: 500),
//           curve: Curves.fastLinearToSlowEaseIn);
//     });
//   }

//   @override
//   void initState() {
//     _pageController = PageController();
//     super.initState();
//   }

//   List<Widget> listTabButton = [
//     TabButton(
//       text: "Tab Page 1",
//       pageNumber: 0,
//     ),
//     TabButton(
//       text: "Tab Page 2",
//       pageNumber: 1,
//     )
//   ];
//   bool _pinned = false;
//   bool _snap = false;
//   bool _floating = false;
//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Material(
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: CustomColor.white,
//               pinned: _pinned,
//               snap: _snap,
//               floating: _floating,
//               expandedHeight: 18,
//               title: Container(
//                 child: CustomAppBar(
//                   isHome: true,
//                 ),
//               ),
//             ),
//             SliverAppBar(
//               backgroundColor: CustomColor.white,
//               pinned: true,
//               snap: _snap,
//               floating: _floating,
//               title: Container(
//                 width: deviceSize.width - 48,
//                 height: 40,
//                 child: Container(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                         prefixIcon: ImageIcon(
//                           AssetImage('assets/images/search.png'),
//                           color: CustomColor.black,
//                         ),
//                         suffixIcon: ImageIcon(
//                           AssetImage('assets/images/filter.png'),
//                           color: CustomColor.black,
//                         ),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide:
//                                 BorderSide(color: CustomColor.black[2]))),
//                   ),
//                 ),
//               ),
//               bottom: PreferredSize(
//                 preferredSize: Size(double.infinity, 30),
//                 child: Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TabButton(
//                         text: "Tab Page 1",
//                         pageNumber: 0,
//                         selectedPage: _selectedPage,
//                         onPressed: () {
//                           _changePage(0);
//                         },
//                       ),
//                       TabButton(
//                         text: "Tab Page 2",
//                         pageNumber: 1,
//                         selectedPage: _selectedPage,
//                         onPressed: () {
//                           _changePage(1);
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     // return  Container(
//     //   child: Column(
//     //     children: [
//     //       Container(
//     //         margin: const EdgeInsets.symmetric(vertical: 24),
//     //         child: CustomAppBar(
//     //           isHome: true,
//     //         ),
//     //       ),
//     //       Row(
//     //         children: [
//     //           Container(
//     //             width: deviceSize.width - 48,
//     //             height: 40,
//     //             child: TextFormField(
//     //               decoration: InputDecoration(
//     //                   prefixIcon: ImageIcon(
//     //                     AssetImage('assets/images/search.png'),
//     //                     color: CustomColor.black,
//     //                   ),
//     //                   suffixIcon: ImageIcon(
//     //                     AssetImage('assets/images/filter.png'),
//     //                     color: CustomColor.black,
//     //                   ),
//     //                   border: OutlineInputBorder(
//     //                       borderRadius: BorderRadius.circular(8),
//     //                       borderSide: BorderSide(color: CustomColor.black[2]))),
//     //             ),
//     //           )
//     //         ],
//     //       ),
//     //       Container(
//     //         child: Row(
//     //           mainAxisAlignment: MainAxisAlignment.center,
//     //           children: [
//     //             TabButton(
//     //               text: "Tab Page 1",
//     //               pageNumber: 0,
//     //               selectedPage: _selectedPage,
//     //               onPressed: () {
//     //                 _changePage(0);
//     //               },
//     //             ),
//     //             TabButton(
//     //               text: "Tab Page 2",
//     //               pageNumber: 1,
//     //               selectedPage: _selectedPage,
//     //               onPressed: () {
//     //                 _changePage(1);
//     //               },
//     //             )
//     //           ],
//     //         ),
//     //       ),
//     //       CustomSizedBox(
//     //         context: context,
//     //         height: 10,
//     //       ),
//     //       Expanded(
//     //         child: PageView(
//     //           onPageChanged: (int page) {
//     //             setState(() {
//     //               _selectedPage = page;
//     //             });
//     //           },
//     //           controller: _pageController,
//     //           children: [
//     //             ListView.builder(
//     //               shrinkWrap: true,
//     //               physics: ScrollPhysics(),
//     //               itemBuilder: (_, index) {
//     //                 return StorageProtectingWidget(
//     //                     data: mockUpData[index], deviceSize: deviceSize);
//     //               },
//     //               itemCount: mockUpData.length,
//     //             ),
//     //             Container(
//     //               child: Center(
//     //                 child: Text("Page 2"),
//     //               ),
//     //             )
//     //           ],
//     //         ),
//     //       )
//     //     ],
//     //   ),
//     // );
//   }
// }
