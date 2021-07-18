import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';

class ButtonIncreaseWidget extends StatefulWidget {
  final String quantity;
  ButtonIncreaseWidget({@required this.quantity});
  @override
  _ButtonIncreaseWidgetState createState() => _ButtonIncreaseWidgetState();
}

class _ButtonIncreaseWidgetState extends State<ButtonIncreaseWidget> {
  int quan = 0;
  @override
  void initState() {
    quan = int.parse(widget.quantity);
    super.initState();
  }

  _decreaseQuantity() {
    setState(() {
      if (quan > 0) {
        quan -= 1;
      }
    });
  }

  _incrementQuantity() {
    setState(() {
      quan += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          child: TextButton(
            onPressed: () {
              _decreaseQuantity();
            },
            child: Image.asset('assets/images/sub.png', fit: BoxFit.cover),
          ),
        ),
        CustomText(
          text: quan.toString(),
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
              },
              child: Image.asset('assets/images/plus.png', fit: BoxFit.cover)),
        ),
      ],
    );
  }
}
