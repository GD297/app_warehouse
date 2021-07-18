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

class ItemComboCart extends StatefulWidget {
  Function pickedDate;
  DateTime dateTime;
  int numberOfStairs;
  Function increaseStairs;
  Function decreaseStairs;
  Function typeStairs;
  ItemComboCart(
      {@required this.pickedDate,
      @required this.dateTime,
      @required this.numberOfStairs,
      @required this.decreaseStairs,
      @required this.typeStairs,
      @required this.increaseStairs});
  @override
  _ItemComboCartState createState() => _ItemComboCartState();
}

class _ItemComboCartState extends State<ItemComboCart> {
  final oCcy = new NumberFormat("#,##0", "en_US");

  bool selectAll;
  DateTime picked;
  @override
  void initState() {
    picked = DateTime.now();
    selectAll = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    Map<String, ItemInCart> listComboItem = cart.findByType("Combo");
    return listComboItem.length > 0
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
                  var item = listComboItem.values.toList()[index].productItem;
                  return Container(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CustomCheckBox(
                                isChecked: listComboItem.values
                                    .toList()[index]
                                    .isCheck,
                                onChange: () {
                                  cart.changeSelectedItem(listComboItem.values
                                      .toList()[index]
                                      .productItem);
                                },
                              ),
                              Container(
                                color: Colors.red,
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
                                  child: Text(
                                    'Discount 10%',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: CustomColor.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                CustomSizedBox(
                                  context: context,
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      oCcy.format(item.price),
                                      style: TextStyle(
                                          color: CustomColor.black,
                                          fontSize: 14,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    CustomSizedBox(
                                      context: context,
                                      width: 5,
                                    ),
                                    CustomText(
                                        text: oCcy
                                                .format(item.price -
                                                    item.price * item.sale)
                                                .toString() +
                                            " VND",
                                        fontWeight: FontWeight.bold,
                                        color: CustomColor.purple,
                                        context: context,
                                        fontSize: 15),
                                  ],
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
                                                  listComboItem.values
                                                      .toList()[index]
                                                      .productItem,
                                                  listComboItem.values
                                                      .toList()[index]
                                                      .quantity);
                                            },
                                            child: Image.asset(
                                                'assets/images/sub.png',
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        CustomText(
                                          text: listComboItem.values
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
                                                    listComboItem.values
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
                                              listComboItem.values
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
                itemCount: listComboItem.length,
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
                            text: "Freeship",
                            color: CustomColor.purple,
                            context: context,
                            fontSize: 17),
                        CustomSizedBox(
                          context: context,
                          width: 20,
                        ),
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
                        CustomText(
                          text: '3 (months)',
                          color: CustomColor.purple,
                          context: context,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
