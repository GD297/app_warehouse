import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/list_order_in_room.dart';
import 'package:flutter/material.dart';

class OwnerDetailRoom extends StatefulWidget {
  @override
  _OwnerDetailRoomState createState() => _OwnerDetailRoomState();
}

class _OwnerDetailRoomState extends State<OwnerDetailRoom> {
  TextEditingController _priceSmallBoxController;
  TextEditingController _priceLargeBoxController;
  double get _priceSmallBox => double.parse(_priceSmallBoxController.text);
  double get _priceLargeBox => double.parse(_priceLargeBoxController.text);
  FocusNode _priceSmallBoxFocusNode;
  FocusNode _priceLargeBoxFocusNode;

  @override
  void initState() {
    super.initState();
    _priceSmallBoxController = TextEditingController();
    _priceLargeBoxController = TextEditingController();
    _priceSmallBoxFocusNode = FocusNode();
    _priceLargeBoxFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _priceSmallBoxController.dispose();
    _priceLargeBoxController.dispose();
    _priceSmallBoxFocusNode.dispose();
    _priceLargeBoxFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFf9faff),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CustomAppBar(
              isHome: false,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CustomText(
              color: CustomColor.black,
              context: context,
              fontSize: 24,
              text: 'Orders ',
              fontWeight: FontWeight.bold,
            ),
          ),
          ListOrderInRoom(),
          CustomSizedBox(
            context: context,
            height: 15,
          ),
          CustomSizedBox(
            context: context,
            height: 24,
          ),
        ],
      ),
    );
  }
}
