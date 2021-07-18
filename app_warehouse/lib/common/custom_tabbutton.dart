import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function onPressed;
  final String iconPath;
  TabButton(
      {this.text,
      this.selectedPage,
      this.pageNumber,
      this.onPressed,
      this.iconPath});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconPath != null
                ? Image.asset(
                    iconPath,
                    width: 20,
                    height: 20,
                  )
                : Column(),
            CustomSizedBox(
              context: context,
              width: 5,
            ),
            Text(
              text ?? "Tab Button",
              style: TextStyle(
                  color: selectedPage == pageNumber
                      ? CustomColor.purple
                      : CustomColor.black,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
