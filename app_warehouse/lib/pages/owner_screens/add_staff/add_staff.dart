import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_input.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';

class AddStaffScreen extends StatefulWidget {
  @override
  _AddStaffScreenState createState() => _AddStaffScreenState();
}

class _AddStaffScreenState extends State<AddStaffScreen> {
  final _focusNodeEmail = FocusNode();
  final _focusName = FocusNode();
  final _focusAddress = FocusNode();
  final _focusPhone = FocusNode();
  final _focusSalary = FocusNode();

  final _controllerEmail = TextEditingController();
  final _controllerName = TextEditingController();
  final _controllerAddress = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerSalary = TextEditingController();

  String _storageName;

  String get _email => _controllerEmail.text;
  String get _name => _controllerName.text;
  String get _address => _controllerAddress.text;
  String get _salary => _controllerSalary.text;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storageName = 'Medium Storage';
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodeEmail.dispose();
    _focusName.dispose();
    _focusAddress.dispose();
    _focusPhone.dispose();

    _controllerEmail.dispose();
    _controllerName.dispose();
    _controllerAddress.dispose();
    _controllerPhone.dispose();
  }

  void onChangeDropdownCButton(String value) {
    setState(() {
      _storageName = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColor.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              isHome: false,
              isOwner: true,
            ),
            CustomSizedBox(
              context: context,
              height: 32,
            ),
            CustomOutLineInput(
              deviceSize: deviceSize,
              labelText: 'Name',
              isDisable: false,
              focusNode: _focusName,
              nextNode: _focusNodeEmail,
              controller: _controllerName,
            ),
            CustomOutLineInput(
              deviceSize: deviceSize,
              labelText: 'Email',
              isDisable: false,
              focusNode: _focusNodeEmail,
              nextNode: _focusName,
              controller: _controllerEmail,
            ),
            CustomOutLineInput(
              deviceSize: deviceSize,
              labelText: 'Address',
              isDisable: false,
              focusNode: _focusAddress,
              controller: _controllerAddress,
              nextNode: _focusPhone,
            ),
            CustomOutLineInput(
              deviceSize: deviceSize,
              labelText: 'Phone',
              isDisable: false,
              focusNode: _focusPhone,
              controller: _controllerPhone,
              nextNode: _focusSalary,
              textInputType: TextInputType.number,
            ),
            CustomOutLineInput(
              deviceSize: deviceSize,
              labelText: 'Salary',
              isDisable: false,
              focusNode: _focusSalary,
              controller: _controllerSalary,
              textInputType: TextInputType.number,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: CustomColor.black[3], width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/arrowDown.png'),
                  ),
                  iconSize: 16,
                  hint: CustomText(
                      text: 'Storage',
                      color: CustomColor.black[2],
                      context: context,
                      fontSize: 16),
                  underline: Container(
                    width: 0,
                  ),
                  value: _storageName,
                  onChanged: onChangeDropdownCButton,
                  items: <String>[
                    'Medium Storage',
                    'Prenium Storage',
                    'Large Storage'
                  ]
                      .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: CustomText(
                              text: e,
                              color: CustomColor.black,
                              context: context,
                              fontSize: 16)))
                      .toList()),
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomButton(
                height: 32,
                text: 'Add',
                width: double.infinity,
                textColor: CustomColor.white,
                onPressFunction: () {},
                buttonColor: CustomColor.purple,
                borderRadius: 4),
          ],
        ),
      ),
    );
  }
}
