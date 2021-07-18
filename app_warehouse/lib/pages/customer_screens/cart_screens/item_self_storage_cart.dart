import 'package:app_warehouse/common/custom_checkbox.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/common/custom_time_tag.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:app_warehouse/provider/item_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ItemStorageCart extends StatefulWidget {
  Function pickedDate;
  DateTime dateTime;
  int initTab;
  Function increaseStairs;
  Function decreaseStairs;
  Function increaseMoths;
  Function decreaseMoths;
  Function typeStairs;
  ItemStorageCart(
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

class _ItemFewCartState extends State<ItemStorageCart> {
  static List<Map<String, dynamic>> mockUpSelfStorateData = [
    {
      'imagePath': 'assets/images/2m2final2.png',
      'name': 'Storage 2m' + String.fromCharCode(0x00B2),
      'decription': 'Used to store small furniture,\nsmall quantity:',
      'price': "600,000",
      'newPrice': "600.000 VND/ month",
      'size': '2m x 4m x 2,5m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '6 boxes of 86m3',
        '1 student desk',
        '1 student seat',
        '1 mini bike'
      ],
    },
    {
      'imagePath': 'assets/images/4m2.png',
      'name': 'Storage 4m' + String.fromCharCode(0x00B2),
      'decription': 'Tương đương kho lưu trữ nhỏ:',
      'price': "1,000,000",
      'newPrice': "1.000.000 VND / month",
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '9 bins of 86m3',
        '1 dining table',
        '4 dining chairs',
        '1 bike',
        '1 single mattress',
        '1 sofa'
      ],
    },
    {
      'imagePath': 'assets/images/8m2.png',
      'name': 'Storage 8m' + String.fromCharCode(0x00B2),
      'decription':
          'Suitcase size M < 70L/ Microwave/ Clothes box < 25kg/ Standing fan/ Baby stroller..',
      'price': "1,600,000",
      'newPrice': '1,600.000 VND / month',
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '12 bins 86m' + String.fromCharCode(0x00B3),
        '1 dining table',
        '4 dining chairs',
        '2 bicycles',
        '1 queen/king mattress',
        '1 set of sofa table',
        '1 coffee table',
        '1 refrigerator 1 door',
        '1 TV',
        '1 small bookshelf',
        '1 small wardrobe ',
      ],
    },
    {
      'imagePath': 'assets/images/16m2.png',
      'name': 'Storage 16m' + String.fromCharCode(0x00B2),
      'decription':
          'Suitcase size L/ Air conditioner/ Bicycle/ Refrigerator 90L/ Folding mattress 1.6/ Single sofa...',
      'price': "2,800,000",
      'newPrice': "2,800,000 VND / month",
      'size': '0.5m x 1m x 2m',
      'quantity': 0,
      'service': 'You transport and pack the furniture yourself',
      'itemContains': [
        '18 bins 86m' + String.fromCharCode(0x00B3),
        '1 dining table',
        '1 set of large tables and chairs',
        '4 dining chairs',
        '4 bicycles',
        '2 queen/king mattress',
        '1 set of sofa table',
        '1 set coffee tables and chairs',
        '1 2-door refrigerator',
        '1 large TV',
        '1 large bookshelf',
        '1 large wardrobe',
        '1 dressing table '
      ]
    },
  ];
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
    return Column(
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
            var item = mockUpSelfStorateData[index];
            return Container(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Row(
                      children: [
                        CustomCheckBox(
                          isChecked: true,
                          onChange: () {
                            cart.changeSelectedItem(
                                listFewItem.values.toList()[index].productItem);
                          },
                        ),
                        Container(
                          width: deviceSize.width * 0.2,
                          child: Image.asset(
                            item['imagePath'],
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
                              item['name'] + ' (' + item['size'] + ')',
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
                                text: item['price'] + " VND",
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.purple,
                                context: context,
                                fontSize: 15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Image.asset(
                                          'assets/images/sub.png',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  CustomText(
                                    text: '2',
                                    color: CustomColor.purple,
                                    context: context,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                            'assets/images/plus.png',
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/delete.png'))
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
          itemCount: mockUpSelfStorateData.length - 2,
        ),
        Container(
          color: CustomColor.white,
          child: Divider(
            thickness: 0.54,
            color: Color(0xFF8D8D8D),
          ),
        ),

        CustomSizedBox(
          context: context,
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                  text: '* You transport and pack the furniture yourself',
                  color: CustomColor.black,
                  context: context,
                  fontSize: 15,
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: CustomText(
                  text:
                      "* We'll give you 3 days free so you can pack and ship your stuff",
                  color: CustomColor.black,
                  context: context,
                  fontSize: 15,
                  maxLines: 2,
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
