import 'package:app_warehouse/common/button_increase_quantity.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/list_cart_item.dart';
import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/accessories_widget.dart';
import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/few_service_widget.dart';
import 'package:app_warehouse/pages/customer_screens/new_home_screen/special_combo_widget.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_warehouse/pages/customer_screens/for_rent_detail/bill_storage_protecting_service.dart';
import 'package:app_warehouse/common/custom_time_tag.dart';
import 'package:provider/provider.dart';

class FewFurniture extends StatelessWidget {
  final Map<String, dynamic> data1;
  FewFurniture({@required this.data1});
  _selectDate(
      {@required BuildContext context,
      @required DateTime initialDate,
      @required DateTime startDate}) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: startDate,
        lastDate: DateTime(2022));
  }

  @override
  Widget build(BuildContext context) {
    final String description =
        'If you are in a situation where there is little accommodation but a lot of furniture, the office has piles of documents and documents, you are a shopaholic but your furniture is piled up, you want to go far but don\'t know how to store things. where to measure. please use Keep Rentals service ';
    final cart = Provider.of<Cart>(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 13, 0, 5),
            child: CustomText(
              text: "Service Details",
              color: CustomColor.black,
              context: context,
              fontSize: 15,
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: CustomText(
                          text: 'Name: ',
                          color: CustomColor.black,
                          context: context,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    CustomSizedBox(
                      context: context,
                      width: 80,
                    ),
                    CustomText(
                      text: "Keep rentals",
                      color: CustomColor.black[2],
                      context: context,
                      fontWeight: FontWeight.w600,
                      maxLines: 7,
                      fontSize: 14,
                    ),
                    CustomSizedBox(
                      context: context,
                      width: 5,
                    ),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: CustomText(
                        text: 'Size: ',
                        color: CustomColor.black,
                        context: context,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 92,
                  ),
                  CustomText(
                    text: 'S, M, L, XL, Bolo Box',
                    color: CustomColor.black[2],
                    context: context,
                    fontWeight: FontWeight.w600,
                    maxLines: 7,
                    fontSize: 14,
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: CustomText(
                        text: 'Type: ',
                        color: CustomColor.black,
                        context: context,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 88,
                  ),
                  CustomText(
                    text: "For Small Furniture",
                    color: CustomColor.black[2],
                    context: context,
                    fontWeight: FontWeight.w600,
                    maxLines: 7,
                    fontSize: 14,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: CustomColor.white,
          child: Divider(
            thickness: 0.54,
            color: Color(0xFF8D8D8D),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox(
                    context: context,
                    height: 8,
                  ),
                  CustomText(
                    text: description,
                    color: CustomColor.black[2],
                    context: context,
                    textAlign: TextAlign.justify,
                    maxLines: 7,
                    fontSize: 14,
                  ),
                  CustomSizedBox(
                    context: context,
                    height: 20,
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
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 13, 0, 5),
                  child: Row(
                    children: [
                      CustomText(
                        text: "Sale Off Combo Services",
                        color: CustomColor.black,
                        context: context,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: " (10%)",
                        color: CustomColor.red,
                        context: context,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
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
              SpecialComboWidget(deviceSize: MediaQuery.of(context).size),
            ],
          ),
        ),
        CustomSizedBox(
          context: context,
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 13, 0, 5),
            child: CustomText(
              text: "Choose size of Box ",
              color: CustomColor.black,
              context: context,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FewServiceWidget(),
          color: Colors.white,
        ),
        CustomSizedBox(
          context: context,
          height: 10,
        ),
        Container(
          color: Colors.white,
          child: AccessoriesWidget(
            currentService: 'mockUpKeepRentalsFewData/listAccessoryForFew',
          ),
        ),
        Container(
          color: Colors.white,
          child: CustomSizedBox(
            context: context,
            height: 10,
            width: double.infinity,
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColor.purple),
                child: TextButton(
                  onPressed: () {
                    cart.addItemForServices("ForFewServices");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListItemCart(
                                  initTab: 1,
                                )));
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
        ),
        Container(
          color: Colors.white,
          child: CustomSizedBox(
            context: context,
            height: 20,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
