import 'package:app_warehouse/common/avatar_widget.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/cart_screen.dart';
import 'package:app_warehouse/pages/owner_screens/add_staff/add_staff.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final bool isOwner;
  final bool isStaff;
  CustomAppBar({this.isHome, this.isOwner: false, this.isStaff});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(double.infinity, 80),
      child: Container(
        color: Colors.transparent,
        width: deviceSize.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              child: isHome
                  ? AvatarWidget(
                      deviceSize: deviceSize,
                      isHome: isHome,
                      name: 'Clarren Jessica',
                      imageUrl: 'assets/images/avatar.png',
                      role: 'Customer')
                  : GestureDetector(
                      onTap: () => {Navigator.of(context).pop()},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Image.asset('assets/images/arrowLeft.png'),
                      ),
                    ),
            ),
            if (isHome == true && isOwner == true)
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddStaffScreen()))
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 24),
                  child: Image.asset('assets/images/addUser.png'),
                ),
              ),
            if (isHome == true && isOwner == false)
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CartScreen()))
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      height: 32,
                      width: 32,
                      child: Stack(overflow: Overflow.visible, children: [
                        Container(
                            height: 24,
                            width: 24,
                            child: Image.asset(
                              'assets/images/buy.png',
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                          right: 4,
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
                                      text: '4',
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.white,
                                      context: context,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        )
                      ])),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
