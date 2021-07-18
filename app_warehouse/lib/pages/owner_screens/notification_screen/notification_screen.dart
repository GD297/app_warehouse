import 'dart:ui';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_checkbox.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_tabbutton.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/bill/new_orders_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _ListItemCartState createState() => _ListItemCartState();
}

class _ListItemCartState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  var _scrollController, _tabController;
  final oCcy = new NumberFormat("#,##0", "en_US");
  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: ScrollPhysics(),
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text(
                "Notification",
              ),
              backgroundColor: CustomColor.purple,
            ),
            SliverAppBar(
              primary: false,
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Container(
                    child: TabButton(
                      text: "Request",
                      pageNumber: 0,
                      onPressed: () {},
                    ),
                  ),
                  TabButton(
                    text: "Order",
                    pageNumber: 1,
                    onPressed: () {},
                  ),
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
          color: Color(0xfff0f0f0),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView(
                children: [
                  for (int i = 0; i < data.length; i++)
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: NewOrderWidget(order: data[i])),
                  CustomSizedBox(
                    context: context,
                    height: 20,
                  ),
                ],
              ),
              ListView(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
