import 'package:app_warehouse/common/custom_app_bar_logo.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/new_home_screen/category_widget.dart';
import 'package:app_warehouse/pages/customer_screens/new_home_screen/most_used_selfstorage_service.dart';
import 'package:app_warehouse/pages/customer_screens/new_home_screen/most_used_service.dart';
import 'package:app_warehouse/pages/customer_screens/new_home_screen/special_combo_widget.dart';
import 'package:flutter/material.dart';

class NewHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 7),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                CustomAppBarLogo(
                  disableSearch: true,
                  isHome: true,
                  isOwner: false,
                ),
                CustomSizedBox(
                  context: context,
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CustomText(
                        text: "Categories",
                        color: CustomColor.black,
                        context: context,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                    color: CustomColor.white,
                    child: Divider(
                        endIndent: 115,
                        indent: 20,
                        thickness: 0.12,
                        color: Colors.black)),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CategoryWidget(),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CustomText(
                        text: "Special Combo",
                        color: CustomColor.black,
                        context: context,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                    color: CustomColor.white,
                    child: Divider(
                        endIndent: 115,
                        indent: 20,
                        thickness: 0.12,
                        color: Colors.black)),
                SpecialComboWidget(deviceSize: deviceSize),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CustomText(
                        text: "Top keep rentals service",
                        color: CustomColor.black,
                        context: context,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                    child: Divider(
                        endIndent: 115,
                        indent: 20,
                        thickness: 0.12,
                        color: Colors.black)),
                MostUsedServiceWidget(deviceSize: deviceSize),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CustomText(
                        text: "Top self-storage service",
                        color: CustomColor.black,
                        context: context,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                    color: CustomColor.white,
                    child: Divider(
                        endIndent: 115,
                        indent: 20,
                        thickness: 0.12,
                        color: Colors.black)),
                MostUsedSelfStorageServiceWidget(deviceSize: deviceSize),
                // Expanded(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     physics: BouncingScrollPhysics(),
                //     itemBuilder: (_, index) {
                //       if (index < mockUpStorageData.length - 1) {
                //         return StorageProtectingWidget(
                //             data: mockUpStorageData[index], deviceSize: deviceSize);
                //       } else if (index == mockUpStorageData.length - 1) {
                //         return Column(
                //           children: [
                // StorageProtectingWidget(
                //                 data: mockUpStorageData[index],
                //                 deviceSize: deviceSize),
                //             CustomSizedBox(
                //               context: context,
                //               height: 72,
                //             )
                //           ],
                //         );
                //       }
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
