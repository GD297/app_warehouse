import 'package:app_warehouse/common/button_increase_quantity.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/list_cart_item.dart';
import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/accessories_widget.dart';
import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/few_service_widget.dart';
import 'package:app_warehouse/pages/customer_screens/keep_rentals_screen/much_service_widget.dart';
import 'package:app_warehouse/pages/customer_screens/new_home_screen/special_combo_widget.dart';
import 'package:app_warehouse/pages/customer_screens/self_storage_screen/all_self_storage_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_warehouse/pages/customer_screens/for_rent_detail/bill_storage_protecting_service.dart';
import 'package:app_warehouse/common/custom_time_tag.dart';

class SelfStorageInfo extends StatelessWidget {
  final Map<String, dynamic> data1;
  SelfStorageInfo({@required this.data1});
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
    String size = '2m' +
        String.fromCharCode(0x00B2) +
        ', 4m' +
        String.fromCharCode(0x00B2) +
        ', 8m' +
        String.fromCharCode(0x00B2) +
        ', 16m' +
        String.fromCharCode(0x00B2);
    final String description =
        'If you are in a situation where there is little accommodation but a lot of furniture, the office has piles of documents and documents, you are a shopaholic but your furniture is piled up, you want to go far but don\'t know how to store things. where to measure. please use Keep Rentals service ';

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
                      text: "Self Storage",
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
                    text: size,
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
                    text: "For Big Furniture",
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
              text: "Keep Rentals",
              color: CustomColor.black,
              context: context,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: AllSelfStorageWidget(),
          color: Colors.white,
        ),
        Container(color: Colors.white, child: AccessoriesWidget()),
        CustomSizedBox(
          context: context,
          height: 10,
        ),
        CustomSizedBox(
          context: context,
          height: 16,
        ),
        Row(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListItemCart(
                                initTab: 2,
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
        CustomSizedBox(
          context: context,
          height: 16,
        ),
      ],
    );
  }
}
