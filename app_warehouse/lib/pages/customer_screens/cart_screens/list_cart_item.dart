import 'dart:ui';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_checkbox.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_tabbutton.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/item_combo_cart.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/item_combo_checkout.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/item_few_cart.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/item_few_checkout.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/item_self_storage_cart.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/item_self_storage_checkout.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class ListItemCart extends StatefulWidget {
  int initTab;
  ListItemCart({this.initTab});
  @override
  _ListItemCartState createState() => _ListItemCartState();
}

class _ListItemCartState extends State<ListItemCart>
    with SingleTickerProviderStateMixin {
  var _scrollController, _tabController;
  final oCcy = new NumberFormat("#,##0", "en_US");
  bool selectAll;
  int currentTab;
  DateTime pickedDate;
  int numberOfStairs;
  int numberOfMoth;
  double stairFee;
  int initTab;
  @override
  void initState() {
    initTab = widget.initTab != null ? widget.initTab : 0;

    _scrollController = ScrollController();
    pickedDate = DateTime.now();
    numberOfStairs = 0;
    numberOfMoth = 0;
    selectAll = false;
    _tabController = TabController(
        vsync: this, length: 3, initialIndex: initTab == 4 ? 1 : initTab);
    currentTab = 0;
    super.initState();
  }

  void changeTab(int tabIndex) {
    setState(() {
      currentTab = tabIndex;
    });
  }

  void increaseMonths() {
    setState(() {
      numberOfMoth += 1;
    });
    print(numberOfMoth);
  }

  void decreaseMonths() {
    setState(() {
      if (numberOfMoth > 0) {
        numberOfMoth -= 1;
      }
    });
    print(numberOfMoth);
  }

  void increaseStairs() {
    setState(() {
      numberOfStairs += 1;
    });
    print(numberOfStairs);
  }

  void decreaseStairs() {
    setState(() {
      if (numberOfStairs > 0) {
        numberOfStairs -= 1;
      }
    });
    print(numberOfStairs);
  }

  void typeStairs(int type) {
    setState(() {
      numberOfStairs = -1;
    });
    print(numberOfStairs);
  }

  Future<void> _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(days: 3)),
        firstDate: DateTime.now().add(Duration(days: 3)),
        lastDate: DateTime(2022));
    setState(() {
      pickedDate = picked;
    });
    print(pickedDate.toString());
  }

  String totalCart(final cart) {
    if (currentTab == 0) {
      if (cart.countByTypeSelected("Combo") > 0) {
        return oCcy
                .format((cart.getTotalCart() + stairFee) -
                    ((cart.getTotalCart() + stairFee) * 0.1))
                .toString() +
            " VND";
      } else {
        return '0';
      }
    }
    if (currentTab == 1) {
      if (cart.countByTypeSelected("FewServices") > 0) {
        return oCcy.format(cart.getTotalCart() + stairFee).toString() + " VND";
      } else {
        return '0';
      }
    }
    print('asdasd' ' + initTab.toString()');
    if (initTab == 4) {
      if (cart.countByTypeSelected("MuchServices") > 0) {
        return oCcy.format(cart.getTotalCart() + stairFee).toString() + " VND";
      } else {
        return '0';
      }
    }
    if (currentTab == 2) {
      if (cart.countByTypeSelected("MuchServices") > 0) {
        return "1,600,000 VND";
      } else {
        return '1,600,000 VND';
      }
    }
  }

  final _chars = '1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    stairFee =
        numberOfStairs > -1 ? (numberOfStairs * 5000.0).toDouble() : 15000.0;
    cart.getTotalCart();

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 5,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
          border: Border.all(
            width: 1,
            color: Color(0xfff0f0f0),
          ),
        ),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomCheckBox(
                isChecked: selectAll,
                onChange: () {
                  setState(() {
                    selectAll = !selectAll;
                  });
                  cart.changeAllSelected(selectAll);
                }),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: deviceSize.width * 0.45,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'Total Price: ',
                            color: CustomColor.black,
                            context: context,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        CustomText(
                          text: totalCart(cart),
                          color: CustomColor.purple,
                          context: context,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    currentTab == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                  text: 'Discount: ',
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              CustomText(
                                text: cart.countByTypeSelected("Combo") > 0
                                    ? '-' +
                                        oCcy
                                            .format(cart.getTotalCart() * 0.1)
                                            .toString() +
                                        " VND"
                                    : "0",
                                color: CustomColor.red,
                                context: context,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            CustomSizedBox(
              context: context,
              width: 10,
            ),
            Container(
              width: deviceSize.width * 0.4,
              child: CustomButton(
                  height: 55,
                  text: 'Buy now',
                  width: double.infinity,
                  textColor: CustomColor.white,
                  onPressFunction: () {
                    if (cart.itemCount > 0) {
                      if (cart.countByTypeSelected("Combo") > 0) {
                        if (currentTab == 0) {
                          var order = Order(
                            expiredDate: DateTime.now().add(Duration(days: 3*30)),
                              typeOrder: 'Combo',
                              numberOfMonth: 3,
                              status: "Paid",
                              id: getRandomString(14).toUpperCase(),
                              amount: (cart.getTotalCart()),
                              listitem: cart.getSelectedItemByType('Combo'),
                              date: DateTime.now(),
                              stairFee: stairFee,
                              shippingFee: 15000.0);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ItemComboCheckout(
                                        order: order,
                                      )));
                        }
                      }
                      if (currentTab == 1) {
                        if (cart.countByTypeSelected("FewServices") > 0) {
                          Map<String, dynamic> listFewServices =
                              cart.getSelectedItemByType('FewServices');
                          Map<String, dynamic> listAccServices =
                              cart.getSelectedItemByType('AccFewServices');
                          listFewServices.addAll(listAccServices);
                          var order = Order(
                             expiredDate: DateTime.now().add(Duration(days: numberOfMoth*30)),
                              typeOrder: 'FewServices',
                              numberOfMonth: numberOfMoth,
                              status: "Paid",
                              id: getRandomString(14).toUpperCase(),
                              amount: (cart.getTotalCart()),
                              listitem: listFewServices,
                              date: DateTime.now(),
                              stairFee: stairFee,
                              shippingFee: 15000.0);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => ItemFewCheckout(
                                order: order,
                              ),
                            ),
                          );
                        }
                      }
                      if (cart.countByTypeSelected("MuchServices") > 0) {
                        if (initTab == 4) {
                          Map<String, dynamic> listFewServices =
                              cart.getSelectedItemByType('MuchServices');
                          Map<String, dynamic> listAccServices =
                              cart.getSelectedItemByType('AccMuchServices');
                          listFewServices.addAll(listAccServices);
                          var order = Order(
                            expiredDate: DateTime.now().add(Duration(days: numberOfMoth*30)),
                              typeOrder: 'MuchServices',
                              numberOfMonth: numberOfMoth,
                              status: "Paid",
                              id: getRandomString(14).toUpperCase(),
                              amount: (cart.getTotalCart()),
                              listitem: listFewServices,
                              date: DateTime.now(),
                              stairFee: stairFee,
                              shippingFee: 15000.0);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => ItemFewCheckout(
                                order: order,
                              ),
                            ),
                          );
                        }
                      }
                    }
                    if (currentTab == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => ItemSelfStorageCheckout()),
                      );
                    }
                  },
                  buttonColor: CustomColor.purple,
                  borderRadius: 4),
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        physics: ScrollPhysics(),
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text(
                "Cart",
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
                      text: "Combo",
                      pageNumber: 0,
                      onPressed: () {
                        changeTab(0);
                      },
                    ),
                  ),
                  TabButton(
                    text: "Item Keeper",
                    pageNumber: 1,
                    onPressed: () {
                      changeTab(1);
                    },
                  ),
                  TabButton(
                    text: "Self-Storage",
                    pageNumber: 2,
                    onPressed: () {
                      changeTab(2);
                    },
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
          color: Color(0xfff0f0f0),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView(
                children: [
                  Container(
                      child: ItemComboCart(
                    pickedDate: _selectDate,
                    dateTime: pickedDate,
                    numberOfStairs: numberOfStairs,
                    decreaseStairs: decreaseStairs,
                    increaseStairs: increaseStairs,
                    typeStairs: typeStairs,
                  ))
                ],
              ),
              ListView(
                children: [
                  ItemFewCart(
                    initTab: widget.initTab,
                    decreaseMoths: decreaseMonths,
                    increaseMoths: increaseMonths,
                    pickedDate: _selectDate,
                    dateTime: pickedDate,
                    decreaseStairs: decreaseStairs,
                    increaseStairs: increaseStairs,
                    typeStairs: typeStairs,
                  )
                ],
              ),
              ListView(
                children: [
                  ItemStorageCart(
                    initTab: widget.initTab,
                    decreaseMoths: decreaseMonths,
                    increaseMoths: increaseMonths,
                    pickedDate: _selectDate,
                    dateTime: pickedDate,
                    decreaseStairs: decreaseStairs,
                    increaseStairs: increaseStairs,
                    typeStairs: typeStairs,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
