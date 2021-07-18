import 'package:app_warehouse/common/custom_accessories.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:expandable/expandable.dart';

import 'package:flutter/material.dart';

class AccessoriesWidget extends StatefulWidget {
  String currentService;
  AccessoriesWidget({this.currentService});
  @override
  _AccessoriesWidgetState createState() => _AccessoriesWidgetState();
}

class _AccessoriesWidgetState extends State<AccessoriesWidget> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return ExpandableNotifier(
        initialExpanded: true,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
          ),
          header: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: Row(
                children: [
                  CustomText(
                    text: "Packing Accessories",
                    color: CustomColor.black,
                    context: context,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                  CustomSizedBox(
                    context: context,
                    width: 5,
                  ),
                  Tooltip(
                    message:
                        "These are the accessories you can choose to pack items sent into storage. ",
                    textStyle: TextStyle(color: CustomColor.black),
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: CustomColor.black,
                        ),
                        color: Colors.white),
                    child: Image.asset(
                      "assets/images/info.png",
                      color: Colors.black26,
                      height: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
          collapsed: null,
          expanded: Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            color: Colors.white,
            child: Column(
              children: [
                AccessoriesCard(
                  currentIndex: widget.currentService,
                  isCart: false,
                  nameAccess: "Tape",
                  price: '22,000 VND',
                  size: "100yard x 4cm",
                  imgPath: "assets/images/icon_bangkeo.png",
                  tooltipIcon: "assets/images/question.png",
                  tooltipImage: "assets/images/bang-keo.png",
                  tooltipMessage: Container(
                    height: deviceSize.height / 1.9,
                    child: Column(
                      children: [
                        Image.asset("assets/images/bang-keo.png"),
                        CustomSizedBox(
                          context: context,
                          height: 20,
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Size: 100yard x 4cm",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Good adhesion on many surfaces",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Contains no harmful substances ",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
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
                AccessoriesCard(
                  currentIndex: widget.currentService,
                  isCart: false,
                  nameAccess: "Premium Locks",
                  price: '165,000 VND',
                  size: "50mm x 75mm",
                  imgPath: "assets/images/icon_okhoa.png",
                  tooltipIcon: "assets/images/question.png",
                  tooltipImage: "assets/images/locks.png",
                  tooltipMessage: Container(
                    height: deviceSize.height / 1.85,
                    child: Column(
                      children: [
                        Image.asset("assets/images/locks.png"),
                        CustomSizedBox(
                          context: context,
                          height: 20,
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Full-Size: 50mm x 75mm",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 5,
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Padlock Size: 40mm x 40mm",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomSizedBox(
                          context: context,
                          height: 5,
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Includes 1 locks and 4 key",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
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
                AccessoriesCard(
                  currentIndex: widget.currentService,
                  isCart: false,
                  nameAccess: "Carton Box",
                  price: '25,000 VND',
                  size: "58cm x 38cm x 34cm",
                  imgPath: "assets/images/thungcarton.png",
                  tooltipIcon: "assets/images/question.png",
                  tooltipImage: "assets/images/carton-box.png",
                  tooltipMessage: Container(
                    height: deviceSize.height / 1.85,
                    child: Column(
                      children: [
                        Image.asset("assets/images/carton-box.png"),
                        CustomSizedBox(
                          context: context,
                          height: 20,
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Size: 58cm x 38cm x 34cm",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Good adhesion on many surfaces",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Contains no harmful substances ",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
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
                AccessoriesCard(
                  currentIndex: widget.currentService,
                  isCart: false,
                  nameAccess: "Air foam, styrofoam",
                  price: '20,000 VND',
                  size: "50cm x 5m x 3mm",
                  imgPath: "assets/images/icon_mangpe.png",
                  tooltipIcon: "assets/images/question.png",
                  tooltipImage: "assets/images/styrofoam.png",
                  tooltipMessage: Container(
                    height: deviceSize.height / 1.8,
                    child: Column(
                      children: [
                        Image.asset("assets/images/styrofoam.png"),
                        CustomSizedBox(
                          context: context,
                          height: 20,
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Size: 50cm x 5m x 3mm",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text:
                                "Waterproof, protects the product from bumps and scratches.",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "High toughness, saving cost and time. ",
                            color: CustomColor.black,
                            context: context,
                            maxLines: 2,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
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
                AccessoriesCard(
                  currentIndex: widget.currentService,
                  isCart: false,
                  nameAccess: "Paper Thick",
                  price: '16,500 VND',
                  size: "35cm x 35cm",
                  imgPath: "assets/images/giaychen.png",
                  tooltipIcon: "assets/images/question.png",
                  tooltipImage: "assets/images/paper-thick.png",
                  tooltipMessage: Container(
                    child: Column(
                      children: [
                        Image.asset("assets/images/paper-thick.png"),
                        CustomSizedBox(
                          context: context,
                          height: 20,
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Size: 100yard x 4cm",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text:
                                "Is a specialized paper used to pack dishes and fragile objects, minimizing impact during transportation\nAlso, used to pack furniture; clothes; electronic; components, accessories, jewelry, in a professional manner, ensuring high safety.",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            maxLines: 20,
                            textAlign: TextAlign.left,
                          ),
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
                AccessoriesCard(
                  currentIndex: widget.currentService,
                  isCart: false,
                  nameAccess: "Air bubble foam",
                  price: '25,000 VND',
                  size: "70cm x 5m",
                  imgPath: "assets/images/bong-bong-khi.png",
                  tooltipIcon: "assets/images/question.png",
                  tooltipImage: "assets/images/air-bubble.png",
                  tooltipMessage: Container(
                    height: deviceSize.height / 2.7,
                    child: Column(
                      children: [
                        Image.asset("assets/images/air-bubble.png"),
                        CustomSizedBox(
                          context: context,
                          height: 25,
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Size: 70cm x 5m",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text:
                                "Waterproof, protects the product from bumps and scratches.\nHigh toughness, saving cost and time. ",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: deviceSize.width,
                          child: CustomText(
                            text: "Contains no harmful substances ",
                            color: CustomColor.black,
                            context: context,
                            fontSize: 15,
                            textAlign: TextAlign.left,
                          ),
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
              ],
            ),
          ),
          builder: (_, collapsed, expanded) {
            return Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: const ExpandableThemeData(crossFadePoint: 0),
            );
          },
        ));
  }
}
