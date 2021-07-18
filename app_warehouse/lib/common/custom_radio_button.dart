import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This Widget is the main application widget.

enum BestTutorSite { GoWithStairs, GoWithElevator }

class CustomRadioButton extends StatefulWidget {
  int numberOfStairs;
  Function increaseStair;
  Function decreaseStair;
  Function typeStairs;
  CustomRadioButton(
      {@required this.numberOfStairs,
      @required this.typeStairs,
      @required this.decreaseStair,
      @required this.increaseStair});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<CustomRadioButton> {
  int quan;
  @override
  void initState() {
    quan = widget.numberOfStairs;
    super.initState();
  }

  _decreaseQuantity() {
    setState(() {
      if (quan > 0) {
        quan -= 1;
      }
    });
    widget.decreaseStair();
  }

  _incrementQuantity() {
    setState(() {
      quan += 1;
    });
    widget.increaseStair();
  }

  _changeTypeStair() {
    setState(() {
      quan = 0;
    });
    widget.typeStairs(-1);
  }

  BestTutorSite _site = BestTutorSite.GoWithStairs;

  Widget _buildChangeQuantitty() {
    return Row(
      children: [
        CustomText(
          text: 'Number of stair: ',
          color: CustomColor.black,
          context: context,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              child: TextButton(
                onPressed: () {
                  _decreaseQuantity();
                },
                child: Image.asset('assets/images/sub.png', fit: BoxFit.cover),
              ),
            ),
            CustomText(
              text: quan.toString(),
              color: CustomColor.purple,
              context: context,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            Container(
              width: 32,
              height: 32,
              child: TextButton(
                  onPressed: () {
                    _incrementQuantity();
                  },
                  child:
                      Image.asset('assets/images/plus.png', fit: BoxFit.cover)),
            ),
          ],
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          focusColor: CustomColor.purple,
          selectedTileColor: CustomColor.purple,
          title: const Text("Stairway  (5.000 VND / stair)"),
          leading: Radio(
            activeColor: CustomColor.purple,
            value: BestTutorSite.GoWithStairs,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        if (_site == BestTutorSite.GoWithStairs) _buildChangeQuantitty(),
        ListTile(
          focusColor: CustomColor.purple,
          selectedTileColor: CustomColor.purple,
          title: const Text("Elevator (15.000 VND)"),
          leading: Radio(
            activeColor: CustomColor.purple,
            value: BestTutorSite.GoWithElevator,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
              _changeTypeStair();
            },
          ),
        ),
      ],
    );
  }
}
