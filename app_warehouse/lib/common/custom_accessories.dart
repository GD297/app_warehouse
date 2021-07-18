import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccessoriesCard extends StatefulWidget {
  final String nameAccess;
  final String size;
  final String price;
  final String imgPath;
  final Widget tooltipMessage;
  final String tooltipIcon;
  final String tooltipImage;
  final bool isCart;
  final Widget quantity;
  final String currentIndex;
  AccessoriesCard(
      {@required this.nameAccess,
      @required this.price,
      @required this.size,
      @required this.imgPath,
      this.tooltipMessage,
      this.tooltipImage,
      this.tooltipIcon,
      @required this.isCart,
      this.quantity,
      this.currentIndex});

  @override
  _AccessoriesCardState createState() => _AccessoriesCardState();
}

class _AccessoriesCardState extends State<AccessoriesCard> {
  int quan = 0;
  @override
  void initState() {
    super.initState();
  }

  _decreaseQuantity() {
    setState(() {
      if (quan > 0) {
        quan -= 1;
      }
    });
  }

  _incrementQuantity() {
    setState(() {
      quan += 1;
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            widget.nameAccess,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: widget.tooltipMessage,
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Row(
      children: [
        Row(
          children: [
            Container(
              child: Image.asset(
                widget.imgPath,
                height: 100,
                width: 100,
              ),
            ),
            CustomSizedBox(
              context: context,
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 28,
                  child: Row(
                    children: [
                      Container(
                        child: CustomText(
                            text: widget.nameAccess,
                            color: CustomColor.black,
                            context: context,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      CustomSizedBox(
                        context: context,
                        width: 5,
                      ),
                      widget.tooltipIcon != null
                          ? TextButton(
                              child: Image.asset(
                                widget.tooltipIcon,
                                height: 14,
                                width: 14,
                              ),
                              onPressed: () {
                                _showDialog(context);
                              },
                            )
                          : Column(),
                    ],
                  ),
                ),
                Container(
                  width: 235,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: '(' + widget.size + ')',
                          color: CustomColor.black,
                          context: context,
                          fontWeight: FontWeight.w300,
                          fontSize: 13),
                      widget.quantity != null
                          ? widget.quantity
                          : Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  child: TextButton(
                                    onPressed: () {
                                      _decreaseQuantity();
                                      if (widget.currentIndex != null) {
                                        List<String> services =
                                            widget.currentIndex.split("/");
                                        cart.decreaseServicesItem(
                                            services[1], widget.nameAccess);
                                      }
                                    },
                                    child: Image.asset('assets/images/sub.png',
                                        fit: BoxFit.cover),
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
                                        if (widget.currentIndex != null) {
                                          List<String> services =
                                              widget.currentIndex.split("/");
                                          cart.increaseServicesItem(
                                              services[1], widget.nameAccess);
                                        }
                                      },
                                      child: Image.asset(
                                          'assets/images/plus.png',
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CustomText(
                      text: widget.price,
                      color: CustomColor.purple,
                      context: context,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
