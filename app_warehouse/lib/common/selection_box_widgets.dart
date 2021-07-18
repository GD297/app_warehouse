import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';



class CustomSelectionBox extends StatelessWidget {
  final List<String> listValues;
  final String initValue;
  final Icon iconDropdown;

  CustomSelectionBox({
    @required this.listValues,
    @required this.initValue,
    this.iconDropdown,
  });

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget(
      listValues: listValues,
      iconDropdown: iconDropdown,
      initValue: initValue,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final List<String> listValues;
  final String initValue;
  final Icon iconDropdown;

  MyStatefulWidget({
    @required this.listValues,
    @required this.initValue,
    this.iconDropdown,
  });
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue;
  @override
  initState() {
    super.initState();
    dropdownValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: CustomColor.purple,
      ),
      onChanged: (String newValue) {
        print(newValue);
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: widget.listValues.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: CustomText(
            text: value,
            color: CustomColor.purple,
            context: context,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        );
      }).toList(),
    );
  }
}
