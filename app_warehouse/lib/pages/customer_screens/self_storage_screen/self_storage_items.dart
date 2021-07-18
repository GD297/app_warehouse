import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';

class SelfStorageItem extends StatefulWidget {
  Map<String, dynamic> listServices;
  SelfStorageItem({@required this.listServices});
  @override
  _FewServiceItemState createState() => _FewServiceItemState();
}

class _FewServiceItemState extends State<SelfStorageItem> {
  void _incrementQuantity(Map<String, dynamic> services) {
    setState(() {
      services['quantity'] += 1;
    });
  }

  void _decreaseQuantity(Map<String, dynamic> services) {
    setState(() {
      if (services['quantity'] > 0) {
        services['quantity'] -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> listItemContain = widget.listServices['itemContains'];
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: CustomColor.white,
        border: Border.all(color: Color(0xFFe8e8e8)),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 12),
            color: Color(0xFF000000).withOpacity(0.06),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: widget.listServices['name'],
                      color: Colors.black,
                      context: context,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Image.asset(
                        widget.listServices['imagePath'],
                        height: 110,
                        width: 110,
                      )),
                  CustomText(
                      text: widget.listServices['newPrice'],
                      color: CustomColor.purple,
                      fontWeight: FontWeight.w800,
                      context: context,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      fontSize: 18)
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            padding: EdgeInsets.only(
              left: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.66,
                  child: CustomText(
                      text: "Full Size",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      context: context,
                      fontSize: 15),
                ),
                CustomText(
                    text: widget.listServices['size'],
                    color: Colors.black,
                    context: context,
                    fontSize: 14),
                CustomSizedBox(
                  context: context,
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.66,
                  child: CustomText(
                      text: "Contains",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      context: context,
                      fontSize: 15),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return CustomText(
                        text: listItemContain[index],
                        color: Colors.black,
                        context: context,
                        fontSize: 14);
                  },
                  itemCount: listItemContain.length,
                ),
                CustomSizedBox(
                  context: context,
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.66,
                  child: CustomText(
                      text: "Service",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      context: context,
                      fontSize: 15),
                ),
                CustomText(
                    text: widget.listServices['service'],
                    color: Colors.black,
                    maxLines: 4,
                    context: context,
                    fontSize: 14),
                Container(
                  padding: EdgeInsets.only(left: 100, top: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        child: TextButton(
                          onPressed: () {
                            _decreaseQuantity(widget.listServices);
                          },
                          child: Image.asset('assets/images/sub.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      CustomText(
                        text: widget.listServices['quantity'].toString(),
                        color: CustomColor.purple,
                        context: context,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        child: TextButton(
                            onPressed: () {
                              _incrementQuantity(widget.listServices);
                            },
                            child: Image.asset('assets/images/plus.png',
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
