import 'package:app_warehouse/common/bill_info_box_widget.dart';
import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';

class SelfStorageBill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomAppBar(
                isHome: false,
                isOwner: false,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSizedBox(context: context, height: 10),
                      Container(
                        width: deviceSize.width * 2.3 / 3,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.location_on,
                                  color: CustomColor.purple,
                                  size: 24.0,
                                ),
                              ),
                              CustomSizedBox(
                                context: context,
                                width: 4,
                              ),
                              CustomText(
                                text: 'Jessica Clarent',
                                color: CustomColor.black,
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomSizedBox(
                                context: context,
                                width: 8,
                              ),
                              Container(
                                height: 20,
                                width: 2,
                                color: CustomColor.black[3],
                              ),
                              CustomSizedBox(
                                context: context,
                                width: 8,
                              ),
                              CustomText(
                                text: '0777547456',
                                color: CustomColor.black,
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ]),
                      ),
                      Row(
                        children: [
                          CustomSizedBox(
                            context: context,
                            width: 24,
                          ),
                          Container(
                            width: deviceSize.width * 2.3 / 3,
                            child: CustomText(
                                text:
                                    'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City',
                                color: CustomColor.black,
                                context: context,
                                fontWeight: FontWeight.w500,
                                maxLines: 2,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
              BillInfoBoxWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
