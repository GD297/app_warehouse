import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/list_cart_item.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBarLogo extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final bool isOwner;
  final bool isStaff;
  final bool disableSearch;
  CustomAppBarLogo(
      {this.isHome,
      this.isOwner: false,
      this.isStaff,
      @required this.disableSearch});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    return PreferredSize(
      preferredSize: Size(double.infinity, 80),
      child: Container(
        color: CustomColor.purple,
        width: deviceSize.width,
        height: disableSearch ? 120 : 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 24),
                    child: Image.asset(
                      'assets/images/logo-3.png',
                      height: 80,
                      width: 120,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ListItemCart()))
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 32,
                      width: 50,
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                'assets/images/buy.png',
                                fit: BoxFit.cover,
                                color: Colors.white,
                              )),
                          Positioned(
                            right: 18,
                            top: -4,
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  color: CustomColor.orange,
                                  child: Center(
                                    child: CustomText(
                                        text: cart.itemCount.toString(),
                                        fontWeight: FontWeight.bold,
                                        color: CustomColor.white,
                                        context: context,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            !disableSearch
                ? Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: deviceSize.width - 48,
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: ImageIcon(
                                AssetImage('assets/images/search.png'),
                                color: CustomColor.black,
                              ),
                              suffixIcon: ImageIcon(
                                AssetImage('assets/images/filter.png'),
                                color: CustomColor.black,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: CustomColor.black[2]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
