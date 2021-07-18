import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillInfoStorageWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  BillInfoStorageWidget({this.data});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: 'ID: ',
                color: CustomColor.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            CustomText(
              text: data["orderId"] == null ? "#001101" : data["orderId"],
              color: CustomColor.black,
              context: context,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        CustomSizedBox(
          context: context,
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: 'Storage Name: ',
                color: CustomColor.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            CustomText(
              text: data['name'],
              color: CustomColor.black,
              context: context,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        CustomSizedBox(
          context: context,
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: 'Address: ',
                color: CustomColor.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            Container(
              width: deviceSize.width / 2,
              child: CustomText(
                text: data['address'],
                color: CustomColor.black,
                context: context,
                textAlign: TextAlign.right,
                maxLines: 2,
                fontSize: 14,
              ),
            ),
          ],
        ),
        CustomSizedBox(
          context: context,
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: 'Months: ',
                color: CustomColor.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            CustomText(
              text: '4',
              color: CustomColor.purple,
              context: context,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        CustomSizedBox(
          context: context,
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: 'Book date: ',
                color: CustomColor.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            CustomText(
              text:
                  DateFormat().addPattern("dd/MM/yyyy").format(DateTime.now()),
              color: CustomColor.purple,
              context: context,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
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
                fontWeight: FontWeight.bold,
                fontSize: 16),
            CustomText(
              text: "35,000,000 VND",
              color: CustomColor.purple,
              context: context,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        //   decoration:
        //       BoxDecoration(border: Border.all(color: CustomColor.purple)),
        //   child: Column(
        //     children: [
        //       // Column(
        //       //   children: [
        //       //     StorageInfoBillWidget(
        //       //       discount: true,
        //       //       size: '1m x 2m x 2,5m',
        //       //       price: '600,000 VND',
        //       //       imagePath: 'assets/images/2m2final2.png',
        //       //       title: "Storage: 2m2",
        //       //       available: "5",
        //       //     ),
        //       //     CustomSizedBox(
        //       //       context: context,
        //       //       height: 16,
        //       //     ),
        //       //     StorageInfoBillWidget(
        //       //         discount: true,
        //       //         size: '2m x 2m x 2,5m',
        //       //         price: '1,000,000 VND',
        //       //         imagePath: 'assets/images/4m2.png',
        //       //         title: "Storage: 4m2",
        //       //         available: "1"),
        //       //   ],
        //       // ),
        //       // CustomSizedBox(
        //       //   context: context,
        //       //   height: 16,
        //       // ),
        //       // Row(
        //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       //   children: [
        //       //     CustomText(
        //       //         text: 'Mechandise Subtotal: ',
        //       //         color: CustomColor.black,
        //       //         context: context,
        //       //         fontWeight: FontWeight.normal,
        //       //         fontSize: 15),
        //       //     CustomText(
        //       //       text: '1,600,000 VND',
        //       //       color: CustomColor.black,
        //       //       context: context,
        //       //       fontSize: 15,
        //       //       fontWeight: FontWeight.w400,
        //       //     ),
        //       //   ],
        //       // ),
        //       // CustomSizedBox(
        //       //   context: context,
        //       //   height: 13,
        //       // ),
        //       // Column(
        //       //   children: [
        //       //     Row(
        //       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       //       children: [
        //       //         CustomText(
        //       //             text: 'Accessories Subtotal: ',
        //       //             color: CustomColor.black,
        //       //             context: context,
        //       //             fontWeight: FontWeight.normal,
        //       //             fontSize: 15),
        //       //         CustomText(
        //       //           text: '212,000 VND',
        //       //           color: CustomColor.black,
        //       //           context: context,
        //       //           fontSize: 15,
        //       //           fontWeight: FontWeight.w400,
        //       //         ),
        //       //       ],
        //       //     ),
        //       //     CustomSizedBox(
        //       //       context: context,
        //       //       height: 3,
        //       //     ),
        //       //     Column(
        //       //       children: [
        //       //         Container(
        //       //           padding: EdgeInsets.only(left: deviceSize.width / 25),
        //       //           child: Row(
        //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       //             children: [
        //       //               CustomText(
        //       //                   text: '• x1 Bandage: ',
        //       //                   color: CustomColor.black,
        //       //                   context: context,
        //       //                   fontWeight: FontWeight.normal,
        //       //                   fontSize: 13),
        //       //               CustomText(
        //       //                 text: '22,000 VND',
        //       //                 color: CustomColor.black,
        //       //                 context: context,
        //       //                 fontSize: 14,
        //       //                 fontWeight: FontWeight.w300,
        //       //               ),
        //       //             ],
        //       //           ),
        //       //         ),
        //       //         CustomSizedBox(
        //       //           context: context,
        //       //           height: 3,
        //       //         ),
        //       //         Container(
        //       //           padding: EdgeInsets.only(left: deviceSize.width / 25),
        //       //           child: Row(
        //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       //             children: [
        //       //               CustomText(
        //       //                   text: '• x1 Premium Locks: ',
        //       //                   color: CustomColor.black,
        //       //                   context: context,
        //       //                   fontWeight: FontWeight.normal,
        //       //                   fontSize: 13),
        //       //               CustomText(
        //       //                 text: '165,000 VND',
        //       //                 color: CustomColor.black,
        //       //                 context: context,
        //       //                 fontSize: 14,
        //       //                 fontWeight: FontWeight.w300,
        //       //               ),
        //       //             ],
        //       //           ),
        //       //         ),
        //       //         CustomSizedBox(
        //       //           context: context,
        //       //           height: 3,
        //       //         ),
        //       //         Container(
        //       //           padding: EdgeInsets.only(left: deviceSize.width / 25),
        //       //           child: Row(
        //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       //             children: [
        //       //               CustomText(
        //       //                   text: '• x1 Carton Box: ',
        //       //                   color: CustomColor.black,
        //       //                   context: context,
        //       //                   fontWeight: FontWeight.normal,
        //       //                   fontSize: 13),
        //       //               CustomText(
        //       //                 text: '25,000 VND',
        //       //                 color: CustomColor.black,
        //       //                 context: context,
        //       //                 fontSize: 14,
        //       //                 fontWeight: FontWeight.w300,
        //       //               ),
        //       //             ],
        //       //           ),
        //       //         ),
        //       //       ],
        //       //     )
        //       //   ],
        //       // ),
        //       // CustomSizedBox(
        //       //   context: context,
        //       //   height: 13,
        //       // ),
        //       // Row(
        //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       //   children: [
        //       //     CustomText(
        //       //         text: 'Discount Subtotal (10%): ',
        //       //         color: CustomColor.black,
        //       //         context: context,
        //       //         fontWeight: FontWeight.normal,
        //       //         fontSize: 15),
        //       //     CustomText(
        //       //       text: '-115,000 VND',
        //       //       color: CustomColor.red,
        //       //       context: context,
        //       //       fontSize: 16,
        //       //       maxLines: 2,
        //       //       fontWeight: FontWeight.w300,
        //       //     ),
        //       //   ],
        //       // ),
        //       // CustomSizedBox(
        //       //   context: context,
        //       //   height: 12,
        //       // ),
        //       // Row(
        //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       //   children: [
        //       //     CustomText(
        //       //         text: 'Order Total: ',
        //       //         color: CustomColor.black,
        //       //         context: context,
        //       //         fontWeight: FontWeight.bold,
        //       //         fontSize: 18),
        //       //     CustomText(
        //       //       text: '1,630,000 VND',
        //       //       color: CustomColor.purple,
        //       //       context: context,
        //       //       fontSize: 18,
        //       //       maxLines: 2,
        //       //       fontWeight: FontWeight.bold,
        //       //     ),
        //       //   ],
        //       // ),
        //     ],
        //   ),
        // ),
        CustomSizedBox(
          context: context,
          height: 14,
        ),
      ],
    );
  }
}
