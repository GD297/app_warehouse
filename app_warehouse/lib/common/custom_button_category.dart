import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:flutter/material.dart';

class ButtonCategory extends StatelessWidget {
  String imgPath;
  Widget textButton;
  Function() onPress;
  ButtonCategory(
      {@required this.imgPath,
      @required this.textButton,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4.5,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: CustomColor.purple),
            child: Container(
              height: 54,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                imgPath,
                width: 30,
                height: 30,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              onPress();
            },
          ),
          CustomSizedBox(
            context: context,
            height: 10,
          ),
          textButton,
        ],
      ),
    );
  }
}
