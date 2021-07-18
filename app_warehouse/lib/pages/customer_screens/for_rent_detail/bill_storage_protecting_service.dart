import 'package:app_warehouse/common/bill_storage_widget.dart';
import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text_button.dart';
import 'package:app_warehouse/pages/customer_screens/history_booking/history_booking_screen.dart';
import 'package:flutter/material.dart';

class BillStorageProtectingService extends StatelessWidget {
  final Map<String, dynamic> data;

  BillStorageProtectingService({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomAppBar(
                isHome: false,
              ),
              BillStorageWidget(data: data, isCheckout: true),
              CustomSizedBox(
                context: context,
                height: 24,
              ),
              Container(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              (HistoryBookingScreen()),
                        ),
                      );
                    },
                    fontSize: 16),
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
