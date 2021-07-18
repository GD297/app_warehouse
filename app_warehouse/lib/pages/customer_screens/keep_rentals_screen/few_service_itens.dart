import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FewServiceItem extends StatefulWidget {
  Map<String, dynamic> listServices;
  bool isCard = false;
  FewServiceItem({@required this.listServices, this.isCard});
  @override
  _FewServiceItemState createState() => _FewServiceItemState();
}

class _FewServiceItemState extends State<FewServiceItem> {
  int quantity = 0;
  void _incrementQuantity() {
    setState(() {
      quantity += 1;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    List<Map<String, dynamic>> listService = widget.listServices['service'];
    List<Map<String, dynamic>> listSize = widget.listServices['item'];
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      height: MediaQuery.of(context).size.width / 1.2,
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return CustomText(
                        text: listSize[index].keys.first +
                            ": " +
                            listSize[index].values.first,
                        color: Colors.black,
                        context: context,
                        fontSize: 14);
                  },
                  itemCount: listSize.length,
                ),
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
                CustomText(
                  text: widget.listServices['decription'],
                  color: Colors.black,
                  maxLines: 5,
                  context: context,
                  fontSize: 14,
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return CustomText(
                        text: listService[index].keys.first +
                            ": " +
                            listService[index].values.first,
                        color: Colors.black,
                        maxLines: 4,
                        context: context,
                        fontSize: 14);
                  },
                  itemCount: listService.length,
                ),
                widget.isCard
                    ? Column()
                    : Container(
                        padding: EdgeInsets.only(left: 100, top: 24),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              child: TextButton(
                                onPressed: () {
                                  _decreaseQuantity();
                                  cart.decreaseServicesItem(
                                      'mockUpKeepRentalsFewData',
                                      widget.listServices['id']);
                                },
                                child: Image.asset('assets/images/sub.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            CustomText(
                              text: quantity.toString(),
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
                                    _incrementQuantity();
                                    cart.increaseServicesItem(
                                        'mockUpKeepRentalsFewData',
                                        widget.listServices['id']);
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
