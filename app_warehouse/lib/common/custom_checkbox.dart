import 'package:app_warehouse/common/custom_color.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  bool isChecked;
  Function onChange;
  CustomCheckBox({@required this.isChecked, @required this.onChange});
  @override
  State<CustomCheckBox> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<CustomCheckBox> {
  bool isChecked;

  void _changeStatus(bool value) {
    setState(() {
      isChecked = !isChecked;
      widget.onChange();
    });
  }

  @override
  Widget build(BuildContext context) {
    isChecked = widget.isChecked;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.purple;
      }
      return CustomColor.purple;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool value) {
        _changeStatus(value);
      },
    );
  }
}
