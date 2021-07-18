import 'package:app_warehouse/common/bill_box_widget.dart';
import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text_button.dart';
import 'package:app_warehouse/pages/customer_screens/bottom_navigation/customer_bottom_navigation.dart';
import 'package:flutter/material.dart';

class BillBoxProtectingService extends StatelessWidget {
  final Map<String, dynamic> data;

  BillBoxProtectingService({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0XFFF0F0F0),
          child: Column(
            children: [
              CustomAppBar(
                isHome: false,
              ),
              BillBoxWidget(data: data, isCheckout: true),
              CustomSizedBox(
                context: context,
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 38,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: CustomColor.purple),
                  child: CustomTextButton(
                      text: 'Place Order',
                      textColor: CustomColor.white,
                      context: context,
                      onPressFunction: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                (CustomerBottomNavigation()),
                          ),
                          (route) => false,
                        );
                      },
                      fontSize: 16),
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
