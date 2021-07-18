import 'package:app_warehouse/common/custom_checkbox.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_radio_button.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/common/custom_time_tag.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:app_warehouse/provider/item_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ItemFewCart extends StatefulWidget {
  Function pickedDate;
  DateTime dateTime;
  int initTab;
  Function increaseStairs;
  Function decreaseStairs;
  Function increaseMoths;
  Function decreaseMoths;
  Function typeStairs;
  ItemFewCart(
      {@required this.pickedDate,
      @required this.dateTime,
      @required this.decreaseStairs,
      @required this.increaseStairs,
      @required this.increaseMoths,
      @required this.decreaseMoths,
      @required this.typeStairs,
      this.initTab});
  @override
  _ItemFewCartState createState() => _ItemFewCartState();
}

class _ItemFewCartState extends State<ItemFewCart> {
  final oCcy = new NumberFormat("#,##0", "en_US");
  int quan = 0;
  bool selectAll;
  DateTime picked;
  @override
  void initState() {
    picked = DateTime.now();
    selectAll = false;
    super.initState();
  }

  void increaseMonth() {
    setState(() {
      quan += 1;
    });
  }

  void decreaseMonth() {
    setState(() {
      if (quan > 0) {
        quan -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    Map<String, ItemInCart> listFewItem = {};
    Map<String, ItemInCart> listAccFewItem = {};
    if (widget.initTab != 4) {
      print(widget.initTab);
      listFewItem = cart.findByType("FewServices");
      listAccFewItem = cart.findByType("AccFewServices");
    } else {
      listFewItem = cart.findByType("MuchServices");
      listAccFewItem = cart.findByType("AccMuchServices");
    }
    return listFewItem.length > 0
        ? Column(
            children: [
              // Container(
              //   color: Colors.white,
              //   child: Row(
              //     children: [
              //       CustomCheckBox(
              //           isChecked: selectAll,
              //           onChange: () {
              //             setState(() {
              //               selectAll = !selectAll;
              //             });
              //             cart.changeAllSelected(selectAll);
              //           }),
              //       CustomSizedBox(
              //         context: context,
              //         width: 10,
              //       ),
              //       CustomText(
              //           text: "Start Date ",
              //           color: Colors.black,
              //           context: context,
              //           fontSize: 15),
              //     ],
              //   ),
              // ),
              Container(
                color: CustomColor.white,
                child: Divider(
                  thickness: 0.54,
                  color: Color(0xFF8D8D8D),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (_, index) {
                  var item = listFewItem.values.toList()[index].productItem;
                  return Container(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CustomCheckBox(
                                isChecked:
                                    listFewItem.values.toList()[index].isCheck,
                                onChange: () {
                                  cart.changeSelectedItem(listFewItem.values
                                      .toList()[index]
                                      .productItem);
                                },
                              ),
                              Container(
                                width: deviceSize.width * 0.2,
                                child: Image.asset(
                                  item.imagePath,
                                  height: deviceSize.width * 0.2,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          CustomSizedBox(
                            context: context,
                            width: 15,
                          ),
                          Container(
                            width: deviceSize.width * 0.6,
                            child: Column(
                              children: [
                                Container(
                                  width: deviceSize.width * 0.6,
                                  child: Text(
                                    item.name +
                                        ' (' +
                                        item.listSize[0].values.first +
                                        ')',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: CustomColor.black, fontSize: 16),
                                  ),
                                ),
                                CustomSizedBox(
                                  context: context,
                                  height: 10,
                                ),
                                Container(
                                  width: deviceSize.width * 0.6,
                                  child: CustomText(
                                      text: oCcy.format(item.price).toString() +
                                          " VND",
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.purple,
                                      context: context,
                                      fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 32,
                                          height: 32,
                                          child: TextButton(
                                            onPressed: () {
                                              cart.decreaseQuantity(
                                                  listFewItem.values
                                                      .toList()[index]
                                                      .productItem,
                                                  listFewItem.values
                                                      .toList()[index]
                                                      .quantity);
                                            },
                                            child: Image.asset(
                                                'assets/images/sub.png',
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        CustomText(
                                          text: listFewItem.values
                                              .toList()[index]
                                              .quantity
                                              .toString(),
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
                                                cart.increaseQuantity(
                                                    listFewItem.values
                                                        .toList()[index]
                                                        .productItem);
                                              },
                                              child: Image.asset(
                                                  'assets/images/plus.png',
                                                  fit: BoxFit.cover)),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cart.decreaseQuantity(
                                              listFewItem.values
                                                  .toList()[index]
                                                  .productItem,
                                              0);
                                        },
                                        icon: Image.asset(
                                            'assets/images/delete.png'))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: listFewItem.length,
              ),
              Container(
                color: CustomColor.white,
                child: Divider(
                  thickness: 0.54,
                  color: Color(0xFF8D8D8D),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (_, index) {
                  var item = listAccFewItem.values.toList()[index].productItem;
                  return Container(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CustomCheckBox(
                                isChecked: listAccFewItem.values
                                    .toList()[index]
                                    .isCheck,
                                onChange: () {
                                  cart.changeSelectedItem(listAccFewItem.values
                                      .toList()[index]
                                      .productItem);
                                },
                              ),
                              Container(
                                width: deviceSize.width * 0.2,
                                child: Image.asset(
                                  item.imagePath,
                                  height: deviceSize.width * 0.2,
                                ),
                              ),
                            ],
                          ),
                          CustomSizedBox(
                            context: context,
                            width: 15,
                          ),
                          Container(
                            width: deviceSize.width * 0.6,
                            child: Column(
                              children: [
                                Container(
                                  width: deviceSize.width * 0.6,
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: CustomColor.black, fontSize: 16),
                                  ),
                                ),
                                CustomSizedBox(
                                  context: context,
                                  height: 10,
                                ),
                                Container(
                                  width: deviceSize.width * 0.6,
                                  child: CustomText(
                                      text: oCcy.format(item.price).toString() +
                                          " VND",
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.purple,
                                      context: context,
                                      fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 32,
                                          height: 32,
                                          child: TextButton(
                                            onPressed: () {
                                              cart.decreaseQuantity(
                                                  listAccFewItem.values
                                                      .toList()[index]
                                                      .productItem,
                                                  listAccFewItem.values
                                                      .toList()[index]
                                                      .quantity);
                                            },
                                            child: Image.asset(
                                                'assets/images/sub.png',
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        CustomText(
                                          text: listAccFewItem.values
                                              .toList()[index]
                                              .quantity
                                              .toString(),
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
                                                cart.increaseQuantity(
                                                    listAccFewItem.values
                                                        .toList()[index]
                                                        .productItem);
                                              },
                                              child: Image.asset(
                                                  'assets/images/plus.png',
                                                  fit: BoxFit.cover)),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cart.decreaseQuantity(
                                              listAccFewItem.values
                                                  .toList()[index]
                                                  .productItem,
                                              0);
                                        },
                                        icon: Image.asset(
                                            'assets/images/delete.png'))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: listAccFewItem.length,
              ),
              Container(
                color: CustomColor.white,
                child: Divider(
                  thickness: 0.54,
                  color: Color(0xFF8D8D8D),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5, left: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/shippingtruck.png',
                          color: CustomColor.purple,
                          height: 25,
                          width: 25,
                        ),
                        CustomSizedBox(
                          context: context,
                          width: 10,
                        ),
                        CustomText(
                            text: "Shipping Fee",
                            color: Colors.black,
                            context: context,
                            fontSize: 15),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: "15,000 VND/ 1km",
                            color: CustomColor.purple,
                            fontWeight: FontWeight.bold,
                            context: context,
                            fontSize: 15),
                        CustomSizedBox(
                          context: context,
                          width: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 13, 0, 5),
                            child: CustomText(
                              text: "Choose your delivery and return time",
                              color: CustomColor.black,
                              context: context,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          color: CustomColor.white,
                          child: Divider(
                            thickness: 0.54,
                            color: Color(0xFF8D8D8D),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Rent Time: ',
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
                                  widget.decreaseMoths();
                                  decreaseMonth();
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
                                    widget.increaseMoths();
                                    increaseMonth();
                                  },
                                  child: Image.asset('assets/images/plus.png',
                                      fit: BoxFit.cover)),
                            ),
                            CustomText(
                                text: "(months)",
                                color: CustomColor.purple,
                                context: context,
                                fontSize: 15)
                          ],
                        ),
                      ],
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: 'Delivery Date: ',
                              color: CustomColor.black,
                              context: context,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => {widget.pickedDate()},
                                icon: ImageIcon(
                                  AssetImage('assets/images/calendar.png'),
                                ),
                              ),
                              CustomText(
                                  text: DateFormat()
                                      .addPattern("dd-MM-yyyy")
                                      .format(widget.dateTime),
                                  color: CustomColor.purple,
                                  context: context,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomTimeTag(),
                    CustomSizedBox(
                      context: context,
                      height: 8,
                    ),
                    Container(
                      width: double.infinity,
                      child: CustomText(
                        text: 'Which type of stair?',
                        color: CustomColor.black,
                        context: context,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomRadioButton(
                        numberOfStairs: 0,
                        decreaseStair: widget.decreaseStairs,
                        increaseStair: widget.increaseStairs,
                        typeStairs: widget.typeStairs),
                    CustomSizedBox(
                      context: context,
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Text("No Item "),
            ),
          );
  }
}
