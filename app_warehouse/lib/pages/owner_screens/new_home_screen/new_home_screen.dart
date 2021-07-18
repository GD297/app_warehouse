import 'package:app_warehouse/common/custom_app_bar_owner_logo.dart';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_tabbutton.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/bill/new_orders_widget.dart';
import 'package:app_warehouse/pages/owner_screens/new_home_screen/tab_room_screen.dart';
import 'package:app_warehouse/pages/owner_screens/new_home_screen/tab_storage_screen.dart';
import 'package:app_warehouse/provider/keep_reantal.dart';
import 'package:flutter/material.dart';

enum StatusBill { PAID, DELIVERIED, CHECK_OUT, TIME_OUT }

class NewHomeScreenOwner extends StatefulWidget {
  @override
  _NewHomeScreenOwnerState createState() => _NewHomeScreenOwnerState();
}

class _NewHomeScreenOwnerState extends State<NewHomeScreenOwner>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> data = [
    {
      'orderId': '#2307202123',
      'customerName': 'Request to get the item back',
      'price': '700,000 VND',
      'expiredDate': '10/12/2021',
      'status': 'New',
      'avatarPath': 'assets/images/avt1.png',
      'months': 1,
    },
    {
      'orderId': '#2307202124',
      'customerName': 'Request to get the item back',
      'price': '700,000 VND',
      'expiredDate': '10/12/2021',
      'status': 'New',
      'avatarPath': 'assets/images/avt2.png',
      'months': 1,
      'storageName': 'USA self Storage'
    },
    {
      'orderId': '#2307202125',
      'customerName': 'Request to get the item back',
      'price': '700,000 VND',
      'expiredDate': '10/12/2021',
      'status': 'Paid',
      'avatarPath': 'assets/images/avt3.png',
      'months': 1,
    },
    {
      'orderId': '#2307202126',
      'customerName': 'Request to get the item back',
      'price': '700,000 VND',
      'expiredDate': '10/12/2021',
      'status': 'Paid',
      'avatarPath': 'assets/images/avatar.png',
      'months': 1,
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
      body: Container(
        child: NestedScrollView(
          physics: ScrollPhysics(),
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: CustomAppBarOwnerLogo(
                  isHome: true,
                  isOwner: false,
                ),
                automaticallyImplyLeading: false,
                excludeHeaderSemantics: false,
                backwardsCompatibility: false,
                backgroundColor: CustomColor.purple,
                toolbarHeight: 150,
                expandedHeight: 0,
                pinned: true,
              ),
              SliverAppBar(
                primary: false,
                bottom: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  tabs: [
                    Container(
                      child: TabButton(
                        text: "Room",
                        pageNumber: 0,
                        onPressed: () {},
                      ),
                    ),
                    TabButton(
                      text: "Storage",
                      pageNumber: 1,
                      onPressed: () {},
                    )
                  ],
                  indicatorColor: CustomColor.purple,
                ),
                pinned: true,
                floating: false,
                snap: false,
                toolbarHeight: 0,
                expandedHeight: 0,
                automaticallyImplyLeading: false,
                backgroundColor: CustomColor.white,
              )
            ];
          },
          body: Container(
            color: Color(0xFFF0F0F0),
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView(
                  children: [TabRoomScreen()],
                ),
                ListView(
                  children: [TabStorageScreen()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
