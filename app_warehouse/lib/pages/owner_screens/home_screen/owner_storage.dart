import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/create_storage/create_storage_screen.dart';
import 'package:app_warehouse/pages/owner_screens/detail_storage/owner_detail_storage.dart';
import 'package:app_warehouse/pages/owner_screens/home_screen/owner_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

class OwnerStorage extends StatelessWidget {
  final Map<String, dynamic> data;
  final Size deviceSize;

  OwnerStorage({@required this.data, @required this.deviceSize});

  Color colorStatusChecking;
  String statusChecking;
  @override
  Widget build(BuildContext context) {
    switch (data['statusChecking']) {
      case StatusCheckingStorage.Approved:
        {
          colorStatusChecking = CustomColor.green;
          statusChecking = 'Approved';
          break;
        }
      case StatusCheckingStorage.Pending:
        {
          colorStatusChecking = CustomColor.orange;
          statusChecking = 'Pending';
          break;
        }
      default:
        {
          colorStatusChecking = CustomColor.red;
          statusChecking = 'Reject';
          break;
        }
    }

    return GestureDetector(
      onTap: () {
        if (data['statusChecking'] == StatusCheckingStorage.Approved) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => OwnerDetailStorage()));
        }
      },
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: CustomColor.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 14,
                    offset: Offset(0, 6),
                    color: Color(0xFF000000).withOpacity(0.06))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Container(
                    width: deviceSize.width,
                    height: deviceSize.height / 5.2,
                    child: Image.asset(
                      data['imagePath'],
                      fit: BoxFit.cover,
                    )),
              ),
              CustomSizedBox(
                height: 16,
                context: context,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: data['name'],
                      color: CustomColor.black,
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: statusChecking,
                      color: colorStatusChecking,
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 8,
              ),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16),
                  child: CustomText(
                      text: data['address'],
                      color: CustomColor.black[2],
                      context: context,
                      maxLines: 2,
                      fontSize: 14)),
              CustomSizedBox(
                context: context,
                height: 8,
              ),
              // Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.only(left: 16),
              //     child: CustomText(
              //         text: data['price'],
              //         color: CustomColor.purple,
              //         context: context,
              //         maxLines: 2,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16)),
              // CustomSizedBox(
              //   context: context,
              //   height: 8,
              // ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: data['rating'] * 1.0,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Color(0xFFFFCC1F),
                          ),
                          itemCount: 5,
                          itemSize: 18,
                          direction: Axis.horizontal,
                        ),
                        CustomText(
                            text: "(10)",
                            color: Color(0XFFb6b6b6),
                            fontWeight: FontWeight.bold,
                            context: context,
                            fontSize: 12),
                      ],
                    ),
                  ],
                ),
              ),

              CustomSizedBox(
                context: context,
                height: 16,
              ),
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/full-size.png',
                          width: 20,
                          height: 20,
                        )),
                        CustomSizedBox(
                          context: context,
                          width: 12,
                        ),
                        CustomText(
                            text: "Storage Size",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16),
                      ],
                    ),
                    CustomText(
                        text: data["size"],
                        color: CustomColor.purple,
                        fontWeight: FontWeight.bold,
                        context: context,
                        fontSize: 16),
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/area.png',
                          width: 25,
                          height: 25,
                        )),
                        CustomSizedBox(
                          context: context,
                          width: 7,
                        ),
                        CustomText(
                            text: "Storage Area",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16),
                      ],
                    ),
                    Row(
                      children: [
                        EasyRichText(
                          "1500m2",
                          patternList: [
                            EasyRichTextPattern(
                                targetString: '2', superScript: true),
                          ],
                          defaultStyle: TextStyle(
                              color: CustomColor.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/price.png',
                          width: 20,
                          height: 20,
                        )),
                        CustomSizedBox(
                          context: context,
                          width: 13,
                        ),
                        CustomText(
                            text: "Price",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 16),
                      ],
                    ),
                    CustomText(
                      text: data['price'],
                      color: CustomColor.purple,
                      fontWeight: FontWeight.bold,
                      context: context,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 16,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 24, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Scaffold(
                                        backgroundColor: CustomColor.white,
                                        body: CreateStorageScreen(
                                          data: data,
                                        ),
                                      )));
                        },
                        child: Image.asset('assets/images/edit.png')),
                    CustomSizedBox(
                      context: context,
                      width: 20 ,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Scaffold(
                                        backgroundColor: CustomColor.white,
                                        body: CreateStorageScreen(
                                          data: data,
                                        ),
                                      )));
                        },
                        child: Image.asset('assets/images/delete.png'))
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
