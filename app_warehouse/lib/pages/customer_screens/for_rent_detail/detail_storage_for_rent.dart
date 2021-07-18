import 'package:app_warehouse/common/avatar_widget.dart';
import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_time_tag.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/for_rent_detail/bill_storage_protecting_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailStorageServiceScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  final List<String> listUpStairs = ["Go with Stairs", "Go with Elevator"];

  DetailStorageServiceScreen({this.data});

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

  Widget _buildOptionStorage(
      {@required BuildContext context,
      @required Size deviceSize,
      @required String price,
      @required String imagePath,
      @required String size,
      @required String title,
      @required bool discount,
      @required String available}) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: deviceSize.width / 3,
                height: deviceSize.height / 5.5,
                child: Center(child: Image.asset(imagePath)),
                decoration: BoxDecoration(
                  color: CustomColor.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 14,
                        color: Color(0x000000).withOpacity(0.06),
                        offset: Offset(0, 6)),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 5,
              ),
              CustomText(
                  text: "Available: " + available,
                  color: Colors.black38,
                  context: context,
                  fontSize: 14)
            ],
          ),
          CustomSizedBox(
            context: context,
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    color: CustomColor.black,
                    context: context,
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomSizedBox(
                    context: context,
                    height: 9,
                  ),
                  CustomText(
                    color: CustomColor.black[2],
                    context: context,
                    text: "Size: ${size}",
                    fontSize: 16,
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    child: Image.asset("assets/images/dollar.png"),
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 7,
                  ),
                  CustomText(
                    text: price,
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 4,
                  ),
                  CustomText(
                    text: '|' + '',
                    color: CustomColor.black,
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 4,
                  ),
                  CustomText(
                    text: 'month',
                    color: CustomColor.black[1],
                    context: context,
                    fontSize: 12,
                  ),
                ],
              ),
              CustomSizedBox(
                context: context,
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: 'Amount: ',
                      color: CustomColor.black,
                      context: context,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  CustomSizedBox(
                    context: context,
                    width: 16,
                  ),
                  Image.asset('assets/images/sub.png'),
                  CustomSizedBox(
                    context: context,
                    width: 8,
                  ),
                  CustomText(
                    text: '1',
                    color: CustomColor.purple,
                    context: context,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 8,
                  ),
                  Image.asset('assets/images/plus.png'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final String description =
        'Warehousing is the act of storing goods that will be sold or distributed later. While a small, home-based business might be warehousing products in a spare room, basement, or garage, larger businesses typically own or rent space in a building that is specifically designed for storage.';
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0XFFF0F0F0),
          width: deviceSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: CustomColor.white,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomAppBar(
                  isHome: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Column(
                  children: [
                    CustomSizedBox(
                      context: context,
                      height: 24,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: deviceSize.width,
                        height: deviceSize.height / 4.8,
                        child: Image.asset('assets/images/storage1.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: data['name'],
                            color: CustomColor.black,
                            context: context,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ],
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 8,
                    ),
                    CustomText(
                      text: data['address'],
                      color: CustomColor.black[2],
                      context: context,
                      fontSize: 14,
                      maxLines: 2,
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 8,
                    ),
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
                    CustomSizedBox(
                      context: context,
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          child: Image.asset(
                            'assets/images/sale.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        CustomSizedBox(
                          context: context,
                          width: 7,
                        ),
                        Container(
                          child: CustomText(
                            text: "Upto 10% Discount when rent over 3 months",
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            context: context,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 10,
                    ),
                  ],
                ),
              ),
              CustomSizedBox(
                context: context,
                height: 10,
              ),
              Container(
                height: deviceSize.height / 8,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(8),
                //     border: Border.all(color: CustomColor.purple)),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AvatarWidget(
                        deviceSize: deviceSize,
                        isHome: false,
                        name: 'Clarren Jessica',
                        imageUrl: 'assets/images/avatar.png',
                        role: 'Owner'),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: deviceSize.height / 16,
                        width: deviceSize.height / 16,
                        color: CustomColor.green,
                        child: TextButton(
                            onPressed: () {},
                            child: Image.asset('assets/images/call.png')),
                      ),
                    ),
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
                    text: "Storage Details",
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: CustomText(
                              text: 'Area: ',
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
                          text: "1500m2",
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
                        Tooltip(
                          message:
                              "\nSize: ${data['size']}\n\nOur large storage units can hold the contents of five rooms, such as mattress sets, sofa sets, refrigerators, washers, dryers, dining room sets, large-screen TVs and many boxes. This is the perfect size if you're in the process of moving or building a new house.\n",
                          child: Image.asset(
                            "assets/images/info.png",
                            color: Colors.black26,
                            height: 16,
                          ),
                        )
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
                              text: 'Size: ',
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
                          text: data['size'],
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
                          width: 80,
                        ),
                        CustomText(
                          text: "Cold Storage",
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
                        // Container(
                        //   child: CustomText(
                        //       text: 'Description',
                        //       color: CustomColor.black,
                        //       context: context,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 16),
                        // ),
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
              // CustomSizedBox(
              //   context: context,
              //   height: 10,
              // ),
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   color: Colors.white,
              //   child: Container(
              //     margin: EdgeInsets.fromLTRB(0, 13, 0, 5),
              //     child: Row(
              //       children: [
              //         CustomText(
              //           text: "Self-Storage",
              //           color: CustomColor.black,
              //           context: context,
              //           fontSize: 15,
              //           fontWeight: FontWeight.w900,
              //         ),
              //         CustomSizedBox(
              //           context: context,
              //           width: 5,
              //         ),
              //         Tooltip(
              //           message:
              //               "These are the accessories you can choose to pack items sent into storage. ",
              //           textStyle: TextStyle(color: CustomColor.black),
              //           margin: EdgeInsets.symmetric(horizontal: 50),
              //           padding:
              //               EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //                 width: 1,
              //                 color: CustomColor.black,
              //               ),
              //               color: Colors.white),
              //           child: Image.asset(
              //             "assets/images/info.png",
              //             color: Colors.black26,
              //             height: 16,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   color: CustomColor.white,
              //   child: Divider(
              //     thickness: 0.54,
              //     color: Color(0xFF8D8D8D),
              //   ),
              // ),
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              //   color: Colors.white,
              //   child: Column(
              //     children: [
              //       _buildOptionStorage(
              //           discount: true,
              //           context: context,
              //           size: '1m x 2m x 2,5m',
              //           deviceSize: deviceSize,
              //           price: '600,000 VND',
              //           imagePath: 'assets/images/2m2final2.png',
              //           title: "Storage: 2m2",
              //           available: "5"),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //       _buildOptionStorage(
              //           discount: true,
              //           context: context,
              //           size: '2m x 2m x 2,5m',
              //           deviceSize: deviceSize,
              //           price: '1,000,000 VND',
              //           imagePath: 'assets/images/4m2.png',
              //           title: "Storage: 4m2",
              //           available: "1"),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //       _buildOptionStorage(
              //           discount: true,
              //           context: context,
              //           size: '2m x 4m x 2,5m',
              //           deviceSize: deviceSize,
              //           price: '1,600,000 VND',
              //           imagePath: 'assets/images/8m2.png',
              //           title: "Storage: 8m2",
              //           available: "10"),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //       _buildOptionStorage(
              //           discount: true,
              //           context: context,
              //           size: '4m x 4m x 2,5m',
              //           deviceSize: deviceSize,
              //           price: '2,800,000 VND',
              //           imagePath: 'assets/images/16m2.png',
              //           title: "Storage: 16m2",
              //           available: "3"),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              CustomSizedBox(
                context: context,
                height: 10,
              ),
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   color: Colors.white,
              //   child: Container(
              //     margin: EdgeInsets.fromLTRB(0, 13, 0, 5),
              //     child: Row(
              //       children: [
              //         CustomText(
              //           text: "Packing Accessories",
              //           color: CustomColor.black,
              //           context: context,
              //           fontSize: 15,
              //           fontWeight: FontWeight.w900,
              //         ),
              //         CustomSizedBox(
              //           context: context,
              //           width: 5,
              //         ),
              //         Tooltip(
              //           message:
              //               "These are the accessories you can choose to pack items sent into storage. ",
              //           textStyle: TextStyle(color: CustomColor.black),
              //           margin: EdgeInsets.symmetric(horizontal: 50),
              //           padding:
              //               EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //                 width: 1,
              //                 color: CustomColor.black,
              //               ),
              //               color: Colors.white),
              //           child: Image.asset(
              //             "assets/images/info.png",
              //             color: Colors.black26,
              //             height: 16,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   color: CustomColor.white,
              //   child: Divider(
              //     thickness: 0.54,
              //     color: Color(0xFF8D8D8D),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              //   color: Colors.white,
              //   child: Column(
              //     children: [
              //       AccessoriesCard(
              //         nameAccess: "Bandage",
              //         price: '22,000 VND',
              //         size: "100yard x 4cm",
              //         imgPath: "assets/images/icon_bangkeo.png",
              //         tooltipIcon: "assets/images/question.png",
              //         tooltipImage: "assets/images/bang-keo.png",
              //         tooltipMessage: Container(
              //           height: deviceSize.height / 1.9,
              //           child: Column(
              //             children: [
              //               Image.asset("assets/images/bang-keo.png"),
              //               CustomSizedBox(
              //                 context: context,
              //                 height: 20,
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Size: 100yard x 4cm",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Good adhesion on many surfaces",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Contains no harmful substances ",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //       AccessoriesCard(
              //         nameAccess: "Premium Locks",
              //         price: '165,000 VND',
              //         size: "50mm x 75mm",
              //         imgPath: "assets/images/icon_okhoa.png",
              //         tooltipIcon: "assets/images/question.png",
              //         tooltipImage: "assets/images/locks.png",
              //         tooltipMessage: Container(
              //           height: deviceSize.height / 1.85,
              //           child: Column(
              //             children: [
              //               Image.asset("assets/images/locks.png"),
              //               CustomSizedBox(
              //                 context: context,
              //                 height: 20,
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Full-Size: 50mm x 75mm",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               CustomSizedBox(
              //                 context: context,
              //                 height: 5,
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Padlock Size: 40mm x 40mm",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               CustomSizedBox(
              //                 context: context,
              //                 height: 5,
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Includes 1 locks and 4 key",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //       AccessoriesCard(
              //         nameAccess: "Carton Box",
              //         price: '25,000 VND',
              //         size: "58cm x 38cm x 34cm",
              //         imgPath: "assets/images/thungcarton.png",
              //         tooltipIcon: "assets/images/question.png",
              //         tooltipImage: "assets/images/carton-box.png",
              //         tooltipMessage: Container(
              //           height: deviceSize.height / 1.85,
              //           child: Column(
              //             children: [
              //               Image.asset("assets/images/carton-box.png"),
              //               CustomSizedBox(
              //                 context: context,
              //                 height: 20,
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Size: 58cm x 38cm x 34cm",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Good adhesion on many surfaces",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Contains no harmful substances ",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //       AccessoriesCard(
              //         nameAccess: "Air foam, styrofoam",
              //         price: '20,000 VND',
              //         size: "50cm x 5m x 3mm",
              //         imgPath: "assets/images/icon_mangpe.png",
              //         tooltipIcon: "assets/images/question.png",
              //         tooltipImage: "assets/images/styrofoam.png",
              //         tooltipMessage: Container(
              //           child: Column(
              //             children: [
              //               Image.asset("assets/images/bang-keo.png"),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Size: 100yard x 4cm",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Good adhesion on many surfaces",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Contains no harmful substances ",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //       AccessoriesCard(
              //         nameAccess: "Paper Thick",
              //         price: '16,500 VND',
              //         size: "35cm x 35cm",
              //         imgPath: "assets/images/giaychen.png",
              //         tooltipIcon: "assets/images/question.png",
              //         tooltipImage: "assets/images/paper-thick.png",
              //         tooltipMessage: Container(
              //           child: Column(
              //             children: [
              //               Image.asset("assets/images/bang-keo.png"),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Size: 100yard x 4cm",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Good adhesion on many surfaces",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Contains no harmful substances ",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //       AccessoriesCard(
              //         nameAccess: "Air bubble foam",
              //         price: '25,000 VND',
              //         size: "70cm x 5m",
              //         imgPath: "assets/images/bong-bong-khi.png",
              //         tooltipIcon: "assets/images/question.png",
              //         tooltipImage: "assets/images/air-bubble.png",
              //         tooltipMessage: Container(
              //           child: Column(
              //             children: [
              //               Image.asset("assets/images/bang-keo.png"),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Size: 100yard x 4cm",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Good adhesion on many surfaces",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //               Container(
              //                 width: deviceSize.width,
              //                 child: CustomText(
              //                   text: "Contains no harmful substances ",
              //                   color: CustomColor.black,
              //                   context: context,
              //                   fontSize: 15,
              //                   textAlign: TextAlign.left,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         color: CustomColor.white,
              //         child: Divider(
              //           thickness: 0.54,
              //           color: Color(0xFF8D8D8D),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // CustomSizedBox(
              //   context: context,
              //   height: 16,
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                            text: 'Month: ',
                            color: CustomColor.black,
                            context: context,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        Container(
                          width: 32,
                          height: 32,
                          child: TextButton(
                            onPressed: () {},
                            child: Image.asset('assets/images/sub.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                        CustomText(
                          text: '1',
                          color: CustomColor.purple,
                          context: context,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          child: TextButton(
                              onPressed: () {},
                              child: Image.asset('assets/images/plus.png',
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    CustomSizedBox(
                      context: context,
                      height: 16,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        children: [
                          CustomText(
                              text: 'Book Date: ',
                              color: CustomColor.black,
                              context: context,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          CustomText(
                              text: DateFormat()
                                  .addPattern("dd-MM-yyyy")
                                  .format(DateTime.now()),
                              color: CustomColor.purple,
                              context: context,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                          IconButton(
                            onPressed: () => {
                              _selectDate(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  startDate: DateTime.now())
                            },
                            icon: ImageIcon(
                              AssetImage('assets/images/calendar.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomTimeTag(),
                    CustomSizedBox(
                      context: context,
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Total Price: ',
                          color: CustomColor.black,
                          context: context,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomSizedBox(
                          context: context,
                          width: 8,
                        ),
                        CustomText(
                            text: data['price'] + '/month',
                            color: CustomColor.purple,
                            context: context,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ],
                    ),
                  ],
                ),
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
                    width: deviceSize.width / 1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CustomColor.purple),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BillStorageProtectingService(
                                      data: data,
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
          ),
        ),
      ),
    );
  }
}
