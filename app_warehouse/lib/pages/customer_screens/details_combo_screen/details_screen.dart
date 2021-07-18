import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/list_cart_item.dart';
import 'package:app_warehouse/pages/customer_screens/details_combo_screen/accessory_widget.dart';
import 'package:app_warehouse/pages/customer_screens/details_combo_screen/combo_items_widget.dart';
import 'package:app_warehouse/provider/accessories_provider.dart';
import 'package:app_warehouse/provider/accessory.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:app_warehouse/provider/combo_item_provider.dart';
import 'package:app_warehouse/provider/keep_reantal.dart';
import 'package:app_warehouse/provider/keep_rental_few_provider.dart';
import 'package:app_warehouse/provider/keep_rental_much_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DetailComboScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  final Size deviceSize;
  DetailComboScreen({@required this.data, @required this.deviceSize});
  final oCcy = new NumberFormat("#,##0", "en_US");
  @override
  Widget build(BuildContext context) {
    final listCombo = Provider.of<ComboItemProdiver>(context);
    final cart = Provider.of<Cart>(context);
    final listFewServives = Provider.of<BoxFew>(context);
    final listMuchServives = Provider.of<BoxMuch>(context);
    final listAccessories = Provider.of<Accessories>(context);
    final comboItem = listCombo.findByID(data["id"].toString());

    List<Box> fewItemServices =
        listFewServives.findAllByName(comboItem.listItem);
    List<Box> muchItemServices =
        listMuchServives.findAllByName(comboItem.listItem);
    List<Accessory> listAc =
        listAccessories.findAllByName(comboItem.listAccessories);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColor.purple,
        title: CustomText(
          text: comboItem.name,
          color: CustomColor.white,
          context: context,
          fontSize: 19,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                comboItem.imagePath,
                width: deviceSize.width,
              ),
              CustomText(
                text: comboItem.name,
                color: CustomColor.black,
                context: context,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              CustomSizedBox(
                context: context,
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: CustomText(
                  text: comboItem.decription,
                  color: CustomColor.black,
                  context: context,
                  fontSize: 16,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: CustomText(
                  text: "Combo Details:",
                  color: CustomColor.black,
                  context: context,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 20,
              ),
              if (fewItemServices.length > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return ComboFewServiceItem(
                      listServices: fewItemServices[index],
                      isCard: false,
                    );
                  },
                  itemCount: fewItemServices.length,
                ),
              if (muchItemServices.length > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return ComboFewServiceItem(
                      listServices: muchItemServices[index],
                      isCard: false,
                    );
                  },
                  itemCount: muchItemServices.length,
                ),
              if (listAc.length > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: CustomColor.white,
                            border: Border.all(color: Color(0xFFe8e8e8)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                offset: Offset(0, 12),
                                color: Color(0xFF000000).withOpacity(0.06),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              AccesoryWidget(
                                accessory: listAc[index],
                                listCombo: comboItem.listAccessories[index],
                              ),
                            ],
                          ),
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 25,
                        )
                      ],
                    );
                  },
                  itemCount: listAc.length,
                ),
              CustomSizedBox(
                context: context,
                height: 0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: CustomColor.white,
                  border: Border.all(color: Color(0xFFe8e8e8)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      offset: Offset(0, 12),
                      color: Color(0xFF000000).withOpacity(0.06),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: CustomText(
                        text: 'Keeping costs: ',
                        color: CustomColor.black,
                        fontWeight: FontWeight.w800,
                        context: context,
                        fontSize: 16,
                      ),
                    ),
                    if (fewItemServices.length > 0)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: comboItem.listItem[index].keys.first +
                                      " " +
                                      fewItemServices[index].name,
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 14),
                              CustomText(
                                  text: oCcy.format(
                                          fewItemServices[index].price) +
                                      " VND",
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 14),
                            ],
                          );
                        },
                        itemCount: fewItemServices.length,
                      ),
                    Container(
                      color: CustomColor.white,
                      child: Divider(
                        thickness: 0.54,
                        color: Color(0xFF8D8D8D),
                      ),
                    ),
                    if (muchItemServices.length > 0)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: muchItemServices[index].name,
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 14),
                              CustomText(
                                  text: oCcy.format(
                                          muchItemServices[index].price) +
                                      " VND",
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 14),
                            ],
                          );
                        },
                        itemCount: muchItemServices.length,
                      ),
                    if (listAc.length > 0)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: comboItem
                                          .listAccessories[index].keys.first +
                                      " " +
                                      listAc[index].name,
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 14),
                              CustomText(
                                  text:
                                      oCcy.format(listAc[index].price) + " VND",
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 14),
                            ],
                          );
                        },
                        itemCount: listAc.length,
                      ),
                    Container(
                      color: CustomColor.white,
                      child: Divider(
                        thickness: 0.54,
                        color: Color(0xFF8D8D8D),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: "Machandise Total",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 14),
                        CustomText(
                            text: oCcy.format(comboItem.price) + " VND",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 14),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: "Discount (10%): ",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 14),
                        CustomText(
                          text: "-" +
                              (oCcy.format(comboItem.price * 0.1)).toString() +
                              " VND",
                          color: CustomColor.black,
                          context: context,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    Container(
                      color: CustomColor.white,
                      child: Divider(
                        thickness: 0.54,
                        color: Color(0xFF8D8D8D),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: "Sub Total: ",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16),
                        CustomText(
                          text: oCcy.format(
                                  comboItem.price - comboItem.price * 0.1) +
                              " VND",
                          color: CustomColor.purple,
                          fontWeight: FontWeight.bold,
                          context: context,
                          fontSize: 17,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: deviceSize.width / 6,
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.purple),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            cart.addItemForCombo(comboItem, "Combo");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Add Card Complete!"),
                            ));
                          },
                          child: Image.asset(
                            'assets/images/Cart.png',
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                      CustomSizedBox(
                        context: context,
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: deviceSize.width / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: CustomColor.purple),
                        child: TextButton(
                          onPressed: () {
                            cart.addItemForCombo(comboItem, "Combo");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListItemCart()));
                          },
                          child: CustomText(
                              text: "Booking Now",
                              color: CustomColor.white,
                              context: context,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
