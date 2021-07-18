import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/provider/item_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemFewWidget extends StatelessWidget {
  final ItemInCart data;

  ItemFewWidget({this.data});
  final oCcy = new NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    // List<Box> listItem = [];
    // List<Box> fewItemServices =
    //     listFewServives.findAllByName(comboItem.listItem);
    // List<Box> muchItemServices =
    //     listMuchServives.findAllByName(comboItem.listItem);

    // List<Accessory> listAc =
    //     listAccessories.findAllByName(comboItem.listAccessories);
    // fewItemServices.forEach((element) {
    //   listItem.add(element);
    // });
    // muchItemServices.forEach((element) {
    //   listItem.add(element);
    // });
    // String item = "";
    // for (int i = 0; i < listItem.length; i++)
    //   item += comboItem.listItem[i].keys.first +
    //       " " +
    //       comboItem.listItem[i].values.first +
    //       ", ";
    // for (int i = 0; i < listAc.length; i++)
    //   item += comboItem.listAccessories[i].keys.first +
    //       " " +
    //       comboItem.listAccessories[i].values.first +
    //       ", ";
    // ;

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
