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
  final ItemInCart data;

  ItemComboWidget({this.data});
  final oCcy = new NumberFormat("#,##0", "en_US");

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
    

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Image.asset(
                  data.productItem.imagePath,
                  fit: BoxFit.fill,
                  height: 90,
                  width: 90,
                )),
                CustomSizedBox(
                  context: context,
                  width: 32,
                ),
                Column(
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
                    Container(
                      child: Row(
                        children: [
                          // for (int i = 0; i < listItem.length; i++)
                          Container(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: CustomText(
                                text: item,
                                color: CustomColor.black,
                                maxLines: 3,
                                context: context,
                                fontSize: 14),
                          ),
                          // for (int i = 0; i < listAc.length; i++)
                          //   CustomText(
                          //       text: comboItem.listAccessories[i].keys.first +
                          //           " " +
                          //           comboItem.listAccessories[i].values.first,
                          //       color: CustomColor.black,
                          //       context: context,
                          //       fontSize: 14),
                        ],
                      ),
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: oCcy.format(data.productItem.price) + ' VND',
                            color: CustomColor.black,
                            context: context,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          CustomText(
                            text: "Qty: " + data.quantity.toString(),
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
