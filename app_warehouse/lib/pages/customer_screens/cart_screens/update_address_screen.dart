import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_input.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';

class UpdateAddressScreen extends StatefulWidget {
  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen> {
  final _focusNodeEmail = FocusNode();

  final _focusName = FocusNode();

  final _focusAddress = FocusNode();

  final _focusPhone = FocusNode();

  final _controllerEmail = TextEditingController();

  final _controllerName = TextEditingController();

  final _controllerAddress = TextEditingController();

  final _controllerPhone = TextEditingController();

  String get _email => _controllerEmail.text;

  String get _name => _controllerName.text;

  String get _address => _controllerAddress.text;

  @override
  void initState() {
    super.initState();
    _controllerEmail.text = 'customer@gmail.com';
    _controllerName.text = 'Jessica Clarent';
    _controllerPhone.text = '077754456';
    _controllerAddress.text =
        'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City';
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: CustomColor.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            CustomAppBar(
              isHome: false,
              isOwner: false,
            ),
            CustomText(
                text: 'Change address ',
                color: CustomColor.black,
                context: context,
                fontWeight: FontWeight.bold,
                fontSize: 24),
            CustomSizedBox(
              context: context,
              height: 16,
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
              textInputType: TextInputType.number,
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomButton(
                height: 32,
                text: 'Confirm',
                width: double.infinity,
                textColor: CustomColor.green,
                onPressFunction: () {},
                buttonColor: CustomColor.lightBlue,
                borderRadius: 4)
          ]),
        ));
  }
}
