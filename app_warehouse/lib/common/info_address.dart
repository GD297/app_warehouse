import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_input.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/customer_screens/cart_screens/update_address_screen.dart';
import 'package:flutter/material.dart';

enum AddressReturn { same, difference }

class InfoAddress extends StatefulWidget {
  @override
  State<InfoAddress> createState() => _InfoAddressState();
}

class _InfoAddressState extends State<InfoAddress> {
  AddressReturn opinion = AddressReturn.same;
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
  Widget _buildFormDifferenceAddress(Size deviceSize) {
    return Column(
      children: [
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => UpdateAddressScreen()));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.location_on,
                        color: CustomColor.purple,
                        size: 20.0,
                      ),
                    ),
                    CustomText(
                      text: 'Address pick up your items',
                      color: CustomColor.black,
                      context: context,
                      fontSize: 17,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                CustomSizedBox(context: context, height: 10),
                Container(
                  width: deviceSize.width * 2.3 / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSizedBox(
                        context: context,
                        width: 24,
                      ),
                      CustomText(
                        text: 'Jessica Clarent',
                        color: CustomColor.black,
                        context: context,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomSizedBox(
                        context: context,
                        width: 8,
                      ),
                      Container(
                        height: 20,
                        width: 2,
                        color: CustomColor.black[3],
                      ),
                      CustomSizedBox(
                        context: context,
                        width: 8,
                      ),
                      CustomText(
                        text: '0777547456',
                        color: CustomColor.black,
                        context: context,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                CustomSizedBox(
                  context: context,
                  height: 8,
                ),
                Row(
                  children: [
                    CustomSizedBox(
                      context: context,
                      width: 24,
                    ),
                    Container(
                      width: deviceSize.width * 2.3 / 3,
                      child: CustomText(
                          text:
                              'Phan Van Tri street, Ward 13, District 5, Ho Chi Minh City',
                          color: CustomColor.black,
                          context: context,
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            CustomSizedBox(
              context: context,
              width: 4,
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: CustomColor.black[3],
                size: 16.0,
              ),
            )
          ],
        ),
      ),
      CustomSizedBox(
        context: context,
        height: 24,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomSizedBox(
                context: context,
                width: 24,
              ),
              CustomText(
                text: 'Address return your items',
                color: CustomColor.black,
                context: context,
                fontSize: 17,
                textAlign: TextAlign.left,
                maxLines: 2,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          ListTile(
            title: const Text('Same with pick up address'),
            leading: Radio(
              activeColor: CustomColor.purple,
              value: AddressReturn.same,
              groupValue: opinion,
              onChanged: (AddressReturn value) {
                setState(() {
                  opinion = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Difference address'),
            leading: Radio(
              activeColor: CustomColor.purple,
              value: AddressReturn.difference,
              groupValue: opinion,
              onChanged: (AddressReturn value) {
                setState(() {
                  opinion = value;
                });
              },
            ),
          ),
        ],
      ),
      if (opinion == AddressReturn.difference)
        _buildFormDifferenceAddress(deviceSize),
    ]);
  }
}
