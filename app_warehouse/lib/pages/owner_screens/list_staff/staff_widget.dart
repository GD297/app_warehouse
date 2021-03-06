import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/list_staff/staff_detail.dart';
import 'package:flutter/material.dart';

class StaffWidget extends StatelessWidget {
  final deviceSize;
  final data;
  StaffWidget({this.deviceSize, this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => StaffDetail(
                      data: data,
                      deviceSize: deviceSize,
                    )));
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    blurRadius: 14,
                    offset: Offset(0, 6),
                    color: Colors.black.withOpacity(0.06))
              ]),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: deviceSize.width / 1.8,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                                width: 48,
                                height: 48,
                                child: Image.asset(
                                  data['avatarPath'],
                                  fit: BoxFit.cover,
                                )),
                          ),
                          CustomSizedBox(
                            context: context,
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: data['staffName'],
                                color: CustomColor.black,
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomSizedBox(
                                context: context,
                                height: 8,
                              ),
                              CustomText(
                                text: data['storageName'],
                                color: CustomColor.black,
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomSizedBox(
                                context: context,
                                height: 8,
                              ),
                              CustomText(
                                text: data['phone'],
                                color: CustomColor.black,
                                context: context,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ])),
                Column(
                  children: [
                    CustomText(
                      text: data['salary'],
                      color: CustomColor.purple,
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )
              ])),
    );
  }
}
