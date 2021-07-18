import 'package:app_warehouse/pages/customer_screens/self_storage_screen/self_storage_info.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(SelfStorageScreen());

/// This Widget is the main application widget.
class SelfStorageScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  SelfStorageScreen({this.data});

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget(
      data: data,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final Map<String, dynamic> data;

  MyStatefulWidget({this.data});
  @override
  _KeepRentalScreenState createState() => _KeepRentalScreenState();
}

class _KeepRentalScreenState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  final List<String> listUpStairs = ["Go with Stairs", "Go with Elevator"];
  var _scrollController, _tabController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  Widget _buildOptionStorage(
      {@required BuildContext context,
      @required Size deviceSize,
      @required String price,
      @required String imagePath,
      @required String size,
      @required String title,
      @required bool discount,
      @required String available}) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: deviceSize.width / 3,
                height: deviceSize.height / 5.5,
                child: Center(child: Image.asset(imagePath)),
                decoration: BoxDecoration(
                  color: CustomColor.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 14,
                        color: Color(0x000000).withOpacity(0.06),
                        offset: Offset(0, 6)),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 5,
              ),
              CustomText(
                  text: "Available: " + available,
                  color: Colors.black38,
                  context: context,
                  fontSize: 14)
            ],
          ),
          CustomSizedBox(
            context: context,
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    color: CustomColor.black,
                    context: context,
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomSizedBox(
                    context: context,
                    height: 9,
                  ),
                  CustomText(
                    color: CustomColor.black[2],
                    context: context,
                    text: "Size: ${size}",
                    fontSize: 16,
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    child: Image.asset("assets/images/dollar.png"),
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 7,
                  ),
                  CustomText(
                    text: price,
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 4,
                  ),
                  CustomText(
                    text: '|' + '',
                    color: CustomColor.black,
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 4,
                  ),
                  CustomText(
                    text: 'month',
                    color: CustomColor.black[1],
                    context: context,
                    fontSize: 12,
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: 'Amount: ',
                      color: CustomColor.black,
                      context: context,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  CustomSizedBox(
                    context: context,
                    width: 16,
                  ),
                  Image.asset('assets/images/sub.png'),
                  CustomSizedBox(
                    context: context,
                    width: 8,
                  ),
                  CustomText(
                    text: '1',
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 8,
                  ),
                  Image.asset('assets/images/plus.png'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final Map<String, dynamic> data1 = widget.data;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text(
                "Self-Storage",
              ),
              expandedHeight: 256,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 80),
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 200,
                  initialPage: 0,
                  indicatorColor: CustomColor.purple,
                  indicatorBackgroundColor: Colors.grey,
                  children: [
                    Image.asset(
                      'assets/images/keep-rentals4.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/keep-rentals.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/keep-rentals2.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                  onPageChanged: (value) {},
                  autoPlayInterval: 3000,
                ),
              ),
              backgroundColor: CustomColor.purple,
            ),
          ];
        },
        controller: _scrollController,
        body: SingleChildScrollView(
          child: Container(
            color: Color(0XFFF0F0F0),
            width: deviceSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSizedBox(
                          context: context,
                          height: 5,
                        ),
                        SelfStorageInfo(data1: data1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:app_warehouse/common/custom_color.dart';
// import 'package:app_warehouse/common/custom_tabbutton.dart';
// import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/few_furniture_widget.dart';
// import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/much_furniture_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

// void main() {
//   runApp(SelfStorageScreen());
// }

// /// This Widget is the main application widget.
// class SelfStorageScreen extends StatelessWidget {
//   final Map<String, dynamic> data;

//   SelfStorageScreen({this.data});

//   @override
//   Widget build(BuildContext context) {
//     return MyStatefulWidget(
//       data: data,
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   final Map<String, dynamic> data;

//   MyStatefulWidget({this.data});
//   @override
//   _MyStatefulWidget createState() => _MyStatefulWidget();
// }

// class _MyStatefulWidget extends State<MyStatefulWidget>
//     with SingleTickerProviderStateMixin {
//   var _scrollController, _tabController;

//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _tabController = TabController(vsync: this, length: 2);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> data1 = widget.data;
//     final deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: NestedScrollView(
//         physics: ScrollPhysics(),
//         controller: _scrollController,
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               pinned: true,
//               title: Text(
//                 "Self Storage",
//               ),
//               expandedHeight: 256,
//               flexibleSpace: Container(
//                 padding: EdgeInsets.only(top: 80),
//                 child: ImageSlideshow(
//                   width: double.infinity,
//                   height: 200,
//                   initialPage: 0,
//                   indicatorColor: CustomColor.purple,
//                   indicatorBackgroundColor: Colors.grey,
//                   children: [
//                     Image.asset(
//                       'assets/images/selfstorage.png',
//                       fit: BoxFit.cover,
//                     ),
//                     Image.asset(
//                       'assets/images/selfstorage1.png',
//                       fit: BoxFit.cover,
//                     ),
//                     Image.asset(
//                       'assets/images/selfstorage2.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ],
//                   onPageChanged: (value) {},
//                   autoPlayInterval: 3000,
//                 ),
//               ),
//               backgroundColor: CustomColor.purple,
//             ),
//             SliverAppBar(
//               primary: false,
//               bottom: TabBar(
//                 isScrollable: true,
//                 controller: _tabController,
//                 indicatorSize: TabBarIndicatorSize.label,
//                 indicatorWeight: 2,
//                 tabs: [
//                   Container(
//                     child: TabButton(
//                       text: "Few",
//                       pageNumber: 0,
//                     ),
//                   ),
//                   TabButton(
//                     text: "Much",
//                     pageNumber: 1,
//                   )
//                 ],
//                 indicatorColor: CustomColor.purple,
//               ),
//               pinned: true,
//               floating: false,
//               snap: false,
//               toolbarHeight: 0,
//               expandedHeight: 0,
//               automaticallyImplyLeading: false,
//               backgroundColor: CustomColor.white,
//             )
//           ];
//         },
//         body: Container(
//           color: Color(0xFFF0F0F0),
//           child: TabBarView(
//             controller: _tabController,
//             children: <Widget>[
//               ListView(
//                 children: [
//                   FewFurniture(
//                     data1: data1,
//                   ),
//                 ],
//               ),
//               ListView(
//                 children: [
//                   MuchFurniture(
//                     data1: data1,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
