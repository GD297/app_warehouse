import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/provider/accessories_provider.dart';
import 'package:app_warehouse/provider/accessory.dart';
import 'package:app_warehouse/provider/item_cart.dart';
import 'package:app_warehouse/provider/keep_reantal.dart';
import 'package:app_warehouse/provider/keep_rental_few_provider.dart';
import 'package:app_warehouse/provider/keep_rental_much_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ItemComboWidget extends StatelessWidget {
  final oCcy = new NumberFormat("#,##0", "en_US");

  final ItemInCart data;
  final bool isTotal;
  ItemComboWidget({this.data, @required this.isTotal});

  @override
  Widget build(BuildContext context) {
    final listFewServives = Provider.of<BoxFew>(context);
    final listMuchServives = Provider.of<BoxMuch>(context);
    final listAccessories = Provider.of<Accessories>(context);
    final comboItem = data.productItem;

    List<Box> listItem = [];
    List<Box> fewItemServices =
        listFewServives.findAllByName(comboItem.listItem);
    List<Box> muchItemServices =
        listMuchServives.findAllByName(comboItem.listItem);

    List<Accessory> listAc =
        listAccessories.findAllByName(comboItem.listAccessories);
    fewItemServices.forEach((element) {
      listItem.add(element);
    });
    muchItemServices.forEach((element) {
      listItem.add(element);
    });
    String item = "";
    for (int i = 0; i < listItem.length; i++)
      item += comboItem.listItem[i].keys.first +
          " " +
          comboItem.listItem[i].values.first +
          ", ";
    for (int i = 0; i < listAc.length; i++)
      item += comboItem.listAccessories[i].keys.first +
          " " +
          comboItem.listAccessories[i].values.first +
          ", ";
    ;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 5,
                    color: Colors.red,
                    child: Image.asset(
                      data.productItem.imagePath,
                      fit: BoxFit.fitHeight,
                    )),
                CustomSizedBox(
                  context: context,
                  width: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: data.productItem.name,
                        color: CustomColor.black,
                        context: context,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomSizedBox(
                        context: context,
                        height: 5,
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < listItem.length; i++)
                            Container(
                              width: MediaQuery.of(context).size.width / 1.6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.6,
                                    child: CustomText(
                                        text: item,
                                        color: CustomColor.black,
                                        maxLines: 3,
                                        context: context,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      CustomSizedBox(
                        context: context,
                        height: 4,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                    text: 'Qty: x' + data.quantity.toString(),
                                    color: CustomColor.black,
                                    fontWeight: FontWeight.bold,
                                    context: context,
                                    fontSize: 13),
                                Container(
                                  child: CustomText(
                                    text: oCcy.format(data.productItem.price) +
                                        ' VND',
                                    textAlign: TextAlign.right,
                                    color: CustomColor.purple,
                                    context: context,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          isTotal
              ? Column(
                  children: [
                    Container(
                      color: CustomColor.white,
                      child: Divider(
                        thickness: 0.54,
                        color: Color(0xFF8D8D8D),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: 'Total (x' +
                                      data.quantity.toString() +
                                      '): ',
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 16),
                              CustomText(
                                text: oCcy.format(data.quantity *
                                        data.productItem.price) +
                                    ' VND',
                                color: CustomColor.purple,
                                context: context,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
