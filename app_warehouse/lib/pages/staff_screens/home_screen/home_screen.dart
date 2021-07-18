import 'package:app_warehouse/common/custom_app_bar_owner_logo.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/staff_screens/home_screen/list_new_order.dart';
import 'package:flutter/material.dart';

class HomeScreenStaff extends StatefulWidget {
  @override
  _HomeScreenStaffState createState() => _HomeScreenStaffState();
}

class _HomeScreenStaffState extends State<HomeScreenStaff> {
  var _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
            ];
          },
          controller: _scrollController,
          physics: ScrollPhysics(),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: CustomText(
                            text: "New Order",
                            textAlign: TextAlign.left,
                            color: Colors.black,
                            context: context,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      ListOrder()
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
